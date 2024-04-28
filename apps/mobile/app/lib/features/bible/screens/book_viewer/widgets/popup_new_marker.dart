import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';
import '../../../../../widgets/custom_text_form_field.dart';
import '../../../../../widgets/widgets.dart';

class PopupNewMarker extends StatefulWidget {
  const PopupNewMarker({super.key});

  @override
  State<PopupNewMarker> createState() => _PopupNewMarkerState();
}

class _PopupNewMarkerState extends State<PopupNewMarker> {
  final TextEditingController usernameController = TextEditingController();
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
  }

  void showCustomToast(String message) {
    Widget toast = Container(
      width: double.infinity,
      height: 48,
      padding: getPadding(left: 16, right: 16, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorConstant.black900ff,
      ),
      child: Text(
        message,
        style: AppStyle.txtRobotoRegular14Gray10002,
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorConstant.whiteA700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      elevation: 5,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Añadir comentario', style: AppStyle.txtNunitoSansSemiBold23),
        CustomIconButton(
          height: getSize(48),
          width: getSize(48),
          variant: IconButtonVariant.NoFill,
          onTap: () {
            Navigator.pop(context);
          },
          child: CustomImageView(
              svgPath: ImageConstant.imgClose, color: ColorConstant.indigo900),
        )
      ]),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            enabled: true,
            focusNode: FocusNode(),
            controller: usernameController,
            hintText: 'Ingrese un comentario',
            margin: getMargin(top: 16),
            variant: TextFormFieldVariant.OutlineBottom,
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            isObscureText: false,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              bibleService.selectedVerses = {};
              Navigator.pop(context);
            },
            child: Text('Cancelar', style: AppStyle.txtNunitoSansSemiBold16)),
        TextButton(
            onPressed: () async {
              Map<dynamic, String> verseSelected = bibleService.selectedVerses;
              // bibleService.addNewPage(usernameController.text);
              bibleService.editMarker(
                  bibleService.selectedBook,
                  bibleService.selectedChapter,
                  verseSelected,
                  usernameController.text);
              usernameController.clear();
              bibleService.selectedVerses = {};

              Navigator.pop(context);
            },
            child: Text('Guardar', style: AppStyle.txtNunitoSansSemiBold16)),
      ],
    );
  }
}
