import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

showAlert(BuildContext context, String title, String subtitle) {
    if (Platform.isAndroid) {
        return showDialog(
            context: context,
            builder: (_) => AlertDialog(
                title: Text(title),
                content: Text(subtitle),
                actions: [
                    MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        elevation: 5,
                        textColor: Colors.blue,
                        child: Text('Ok'),
                    )
                ],
            ));

    }

    return  showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () => Navigator.pop(context),
                    child: Text('Ok'),
                )
            ],
        ));

}
