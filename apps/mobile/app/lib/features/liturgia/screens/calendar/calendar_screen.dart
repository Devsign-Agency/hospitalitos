import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class LiturgiaCalendarScreen extends StatelessWidget {
  static const String route = 'calendar-route';
  const LiturgiaCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LiturgyService liturgyService = Provider.of<LiturgyService>(context);


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
                Text(getCurrentDate(),
                    style: AppStyle.txtNunitoSansSemiBold20Black900),
                CustomImageView(
                    width: 24,
                    height: 24,
                    color: ColorConstant.whiteA700,
                    svgPath: ImageConstant.imgEditIndigo900,
                    onTap: () {
                      _handleEditDate(context);
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
    );


    
  }

  void _handleSelectedItem(dynamic item) {
    print(item);
  }

  getCurrentDate() {

    
    final DateFormat format2 = DateFormat.yMMMMd('es_ES');
    return format2.format(DateTime.now()).split('de 2024')[0];
  }

  _handleEditDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
            primary: ColorConstant.indigo900, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.blue, // body text color
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
    print(date);
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
    final day = DateTime.now().toString().split(' ')[0];
    print(day);
    List<Widget> arr = [];
  
   liturgyService.liturgies.forEach((liturgia) {
      final date = liturgia['date'];
          if (date == day)
            {
              final detail = liturgia['detail'];
                 detail.forEach((info){ arr.add(
                  Text(info, style: AppStyle.txtNunitoSansRegular16)); });
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
