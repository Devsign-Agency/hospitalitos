import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/features/liturgia/screens/screens.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';
import 'package:excel/excel.dart';

import '../../../bible/screens/screens.dart';
import '../../../library/screens/courses/discover_screen.dart';
import '../../../main/pages/pages.dart';

class LiturgiaCalendarScreen extends StatelessWidget {
  static const String route = 'calendar-route';
  const LiturgiaCalendarScreen({Key? key}) : super(key: key);

  handleChangeBottomNavigationBar(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
        break;
      case 1:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => DiscoverScreen()),
            (Route<dynamic> route) => false);
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LiturgiaCalendarScreen()),
            (Route<dynamic> route) => false);
        break;
      case 3:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BibleMain()),
            (Route<dynamic> route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    LiturgyService liturgyService =
        Provider.of<LiturgyService>(context, listen: true);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Liturgia',
        backgroundColor: ColorConstant.gray50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),

            // Liturgy Reading Date
            CustomCard(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getCurrentDate(liturgyService.date),
                    style: AppStyle.txtNunitoSansSemiBold20Black900),
                CustomImageView(
                    width: 24,
                    height: 24,
                    color: ColorConstant.indigo900,
                    svgPath: ImageConstant.imgEditIndigo900,
                    onTap: () {
                      _handleEditDate(context, liturgyService);
                    }),
              ],
            )),

            // Readings
            liturgyOfTheDay(liturgyService: liturgyService),

            // Item List
            CustomCard(
                child: ListCollapseItem(
              items: liturgyService.items,
              onSelectedItem: _handleSelectedItem,
            )),

            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 2,
          onChangeIndex: (int index) =>
              handleChangeBottomNavigationBar(index, context),
          bottomMenuList: BibleService.bottomMenuList),
    );
  }

  Future<void> main() async {
    final data = await rootBundle.load('assets/epubs/data.xlsx');
    final bytes = data.buffer.asUint8List();
    //var bytes = File('assets/epubs/data.xlsx').readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    List<Map<String, dynamic>> jsonData = [];

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        Map<String, dynamic> rowMap = {};
        for (int i = 1; i < row.length; i++) {
          rowMap['columna_$i'] = row[i]!.value;
        }
        jsonData.add(rowMap);
      }
    }

    print(jsonData);
  }

  Future<void> loadJsonAsset() async {
    final String jsonString =
        await rootBundle.loadString('assets/epubs/data.json');
    final data = jsonDecode(jsonString);
    print(data);
    return data;
  }

  void _handleSelectedItem(context, dynamic item) {
    Navigator.of(context).pushNamed(DetailLiturgyScreen.route);
  }

  getCurrentDate(date) {
    final DateFormat format2 = DateFormat.yMMMMd('es_ES');

    DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .parse(date + 'T00:00:00.000Z');
    var inputDate = DateTime.parse(parseDate.toString());
    String formattedDate = DateFormat.yMMMEd('es_ES').format(inputDate);
    return formattedDate;
  }

  _handleEditDate(BuildContext context, LiturgyService liturgyService) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month, 31),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
            primary: ColorConstant.yellow100, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black,
          )),
          // data: ThemeData.light().copyWith(
          //     primaryColor: const Color(0xFF4A5BF6), //Head background
          //     colorScheme: ColorScheme.light(background: Colors.white),
          //     dialogBackgroundColor: Colors.red,
          //     dialogTheme: DialogTheme(
          //         backgroundColor: Colors.white,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(4))))),
          child: child ?? Text(''),
        );
      },
    );
    // DateTime? date = await showDatePicker(
    //     context: context,

    //     locale: const Locale('es', 'ES'),
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(1900),
    //     lastDate: DateTime(2100));

    // dateCtl.text = date.toIso8601String();

    if (date != null) {
      var newDate = date.toString().split(' ')[0];
      liturgyService.date = newDate;
    } else {
      date = DateTime.now();
      var newDate = date.toString().split(' ')[0];
      liturgyService.date = newDate;
    }
  }
}

class liturgyOfTheDay extends StatelessWidget {
  const liturgyOfTheDay({
    super.key,
    required this.liturgyService,
  });

  final LiturgyService liturgyService;

  @override
  Widget build(BuildContext context) {
    final day = liturgyService.date;
    print(day);
    List<Widget> arr = [];

    liturgyService.liturgies.forEach((liturgia) {
      final date = liturgia['date'];
      if (date == day) {
        final detail = liturgia['detail'];
        detail.forEach((info) {
          arr.add(Text(info, style: AppStyle.txtNunitoSansRegular16));
        });
      }
    });

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: arr.toList(),
      ),
    );
  }
}
