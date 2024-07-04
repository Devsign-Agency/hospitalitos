import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class SaintDetailsScreen extends StatefulWidget {
  static const String route = 'saints-route';

  const SaintDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SaintDetailsScreen> createState() => _SaintDetailsScreenState();
}

class _SaintDetailsScreenState extends State<SaintDetailsScreen> {
  var _scrollController = ScrollController();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isExpanded = _isSliverAppBarExpanded;
      });
    });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (50);
  }

  @override
  Widget build(BuildContext context) {
    Saint saint = ModalRoute.of(context)!.settings!.arguments as Saint;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomSliverAppBar(
              isExpanded: _isExpanded,
              pathImage: saint.image!.isNotEmpty
                  ? 'assets/images/saints/${saint.image!}'
                  : '',
              linkShare: '',
              title: saint.name),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: getPadding(left: 16, right: 16, top: 16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        saint.name,
                        style: AppStyle.txtNunitoSansSemiBold26,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Biografía',
                        textAlign: TextAlign.left,
                        style: AppStyle.txtNunitoSansSemiBold26,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        saint.description,
                        style: AppStyle.txtNunitoSansSemiBold20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
