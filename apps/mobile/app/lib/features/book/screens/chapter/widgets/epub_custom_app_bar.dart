import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';
import '../../../../../themes/themes.dart';
import '../../../../../widgets/widgets.dart';

class EpubAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool isActivePlay;
  final double height;
  final Function(bool) onTapPlay;
  final Function(int) onSelectedMenu;

  EpubAppBar({
    this.height = kToolbarHeight,
    required this.title,
    required this.onTapPlay,
    this.isActivePlay = false,
    required this.onSelectedMenu,
  });

  @override
  State<EpubAppBar> createState() => _EpubAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _EpubAppBarState extends State<EpubAppBar> {
  bool onAudioSound = false;

  @override
  void initState() {
    super.initState();

    onAudioSound = widget.isActivePlay;
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActivePlay != oldWidget.isActivePlay) {
      onAudioSound = widget.isActivePlay;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    final List<PopupMenuItemModel> menuOptions = [
      PopupMenuItemModel(id: 1, title: 'Ajustar texto', onTappedItem: () {}),
      PopupMenuItemModel(id: 2, title: 'Compartir', onTappedItem: () {}),
      PopupMenuItemModel(id: 3, title: 'Marcadores', onTappedItem: () {}),
    ];

    return AppBar(
      title: Text(widget.title),
      leading: CustomIconBackButton(isDarkTheme: false),
      elevation: 0,
      actions: [
        CustomIconButton(
          margin: getMargin(left: 8),
          height: getSize(48),
          width: getSize(48),
          variant: !onAudioSound
              ? IconButtonVariant.NoFill
              : IconButtonVariant.OutlinePurple50,
          onTap: () {
            setState(() {
              onAudioSound = !onAudioSound;
              widget.onTapPlay(onAudioSound);
            });
          },
          child: CustomImageView(
            svgPath: ImageConstant.imgMusicIndigo900,
            color: isDarkTheme
                ? (onAudioSound
                    ? ColorConstant.indigo900
                    : ColorConstant.whiteA700)
                : ColorConstant.gray800,
          ),
        ),
        EpubPopupMenuButton(
          isDarkMode: false,
          menuOptions: menuOptions,
          onTap: widget.onSelectedMenu,
        ),
      ],
    );
  }
}

class EpubPopupMenuButton extends StatelessWidget {
  final bool isDarkMode;
  final List<PopupMenuItemModel> menuOptions;
  final Function(int) onTap;

  const EpubPopupMenuButton(
      {super.key,
      required this.isDarkMode,
      required this.menuOptions,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        onSelected: onTap,
        color: isDarkMode ? ColorConstant.gray30002 : ColorConstant.gray100,
        constraints: BoxConstraints(
          minWidth: 200,
        ),
        offset: Offset(20, 60),
        itemBuilder: (context) => [
              ...menuOptions.map((item) => PopupMenuItem(
                    value: item.id,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(item.title,
                            style: AppStyle.txtNunitoSansRegular18WhiteA700
                                .copyWith(
                                    color: isDarkMode
                                        ? ColorConstant.whiteA700
                                        : ColorConstant.black900))),
                  ))
            ]);
  }
}
