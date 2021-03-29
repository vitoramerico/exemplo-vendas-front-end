import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final String btnNameCancel;
  final String btnNameConfirm;
  final VoidCallback? onPressedConfirm;
  final VoidCallback? onPressedCancel;

  const CustomDialogWidget({
    Key? key,
    this.title = 'Atencao',
    required this.content,
    this.btnNameCancel = 'Cancelar',
    this.btnNameConfirm = 'OK',
    this.onPressedConfirm,
    this.onPressedCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: content,
      actions: <Widget>[
        onPressedCancel != null
            ? TextButton(
                child: Text(
                  btnNameCancel.toUpperCase(),
                  style: const TextStyle(color: Colors.redAccent),
                ),
                onPressed: onPressedCancel,
              )
            : Container(),
        onPressedConfirm != null
            ? TextButton(
                child: Text(
                  btnNameConfirm.toUpperCase(),
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                onPressed: onPressedConfirm,
              )
            : Container(),
      ],
    );
  }
}
