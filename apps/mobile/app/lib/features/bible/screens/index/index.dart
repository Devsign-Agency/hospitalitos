import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class IndexScreen extends StatefulWidget {
  static const String route = 'index-route';

  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    const List<String> tabItems = ['Libros', 'Capítulos', 'Versículos', 'Tab'];
    const List<String> bookNames = [
      'Génesis',
      'Éxodo',
      'Levítico',
      'Números',
      'Deuteronomio',
      'Josué',
      'Jueces',
      'Rut',
      'Samuel I',
      'Reyes I'
          'Deuteronomio',
      'Josué',
      'Jueces',
      'Rut',
      'Samuel I',
      'Reyes I'
          'Deuteronomio',
      'Josué',
      'Jueces',
      'Rut',
      'Samuel I',
      'Reyes I'
    ];
    final double height = MediaQuery.of(context).size.height - 28;
    final boxShadow = [
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 12.0),
        blurRadius: 32.0,
        spreadRadius: -4.0,
      ), //BoxSha
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 8.0),
        blurRadius: 18.0,
        spreadRadius: -6.0,
      ), //BoxShadow
    ];
    return Scaffold(
        appBar: _CustomAppBar(
          title: 'Índice',
          backgroundColor: ColorConstant.gray50,
          actions: [
            CustomIconButton(
              height: getSize(48),
              width: getSize(48),
              variant: IconButtonVariant.NoFill,
              child: CustomImageView(
                svgPath: ImageConstant.imgSearch,
              ),
            ),
          ],
          bottom: [],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: TabBar(
                      labelPadding: EdgeInsets.all(0),
                      labelColor: Colors.black,
                      controller: tabController,
                      indicatorColor: ColorConstant.indigo900,
                      dividerColor: ColorConstant.transparent,
                      tabs: [
                        ...tabItems.map((item) => Tab(
                                child: Text(
                              item,
                              style: AppStyle.txtNunitoSansSemiBold16Indigo900,
                            )))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  SizedBox(height: 19),
                                  ...bookNames.map((e) => Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          e,
                                          style: AppStyle
                                              .txtNunitoSansRegular18Gray900,
                                        ),
                                      ))
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: getSize(48),
                                decoration: BoxDecoration(
                                    color: ColorConstant.yellow100,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: boxShadow),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Siguiente',
                                    style: AppStyle.txtNunitoSansSemiBold16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Column(
                        //   children: [
                        //     Expanded(
                        //       child: GridView.count(
                        //         shrinkWrap: true,
                        //         // Create a grid with 2 columns. If you change the scrollDirection to
                        //         // horizontal, this produces 2 rows.
                        //         crossAxisCount: 5,
                        //         // Generate 100 widgets that display their index in the List.
                        //         children: List.generate(100, (index) {
                        //           return Center(
                        //             child: Text(
                        //               '$index',
                        //               style: Theme.of(context)
                        //                   .textTheme
                        //                   .headlineSmall,
                        //             ),
                        //           );
                        //         }),
                        //       ),
                        //     ),
                        //     Positioned(
                        //       top: MediaQuery.of(context).size.height - 280,
                        //       child: GestureDetector(
                        //         // TODO: Sugerencia, usar un customIconButton
                        //         onTap: () {},
                        //         child: Container(
                        //           width: double.infinity,
                        //           height: getSize(48),
                        //           decoration: BoxDecoration(
                        //               color: ColorConstant.yellow100,
                        //               borderRadius: BorderRadius.circular(12),
                        //               boxShadow: boxShadow),
                        //           child: Align(
                        //             alignment: Alignment.center,
                        //             child: Text(
                        //               'Siguiente',
                        //               style: AppStyle.txtNunitoSansSemiBold16,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Text('Text 3'),
                        Text('Text 3'),
                        Text('Text 4'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? tabs;
  final List<Widget>? bottom;

  const _CustomAppBar({
    super.key,
    this.backgroundColor = Colors.red,
    this.textIconColor = Colors.red,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
    this.actions,
    this.leading,
    this.tabs,
    this.bottom,
  });
  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: leading,
      backgroundColor: backgroundColor,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: getMargin(bottom: 20),
              child: Text('$title', style: AppStyle.txtNunitoSansSemiBold26))),
      actions: [if (actions != null) ...actions!, SizedBox(width: 16)],
    );
  }
}
