import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

enum SnackBarTpEnum {
  sucess,
  info,
  error,
}

const int snackBarDefaultTime = 3;

extension SnackBarTpEnumExt on SnackBarTpEnum {
  String get displayName {
    switch (this) {
      case SnackBarTpEnum.sucess:
        return 'Sucesso';
      case SnackBarTpEnum.info:
        return 'Informação';
      case SnackBarTpEnum.error:
        return 'Erro';
      default:
        return 'is null';
    }
  }

  Color get color {
    switch (this) {
      case SnackBarTpEnum.sucess:
        return Colors.green;
      case SnackBarTpEnum.info:
        return Colors.amber;
      case SnackBarTpEnum.error:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  IconData? get icon {
    switch (this) {
      case SnackBarTpEnum.sucess:
        return Icons.check;
      case SnackBarTpEnum.info:
        return Icons.info_outline;
      case SnackBarTpEnum.error:
        return Icons.close;
      default:
        return null;
    }
  }
}

class MySnackBarModel {
  String msg;
  SnackBarTpEnum type;
  int seconds;

  MySnackBarModel({this.msg = ' ', this.type = SnackBarTpEnum.sucess, this.seconds: snackBarDefaultTime});
}

class MySnackBar {
  static void show(MySnackBarModel model) {
    Get.rawSnackbar(
      backgroundColor: const Color(0xFF303030),
      duration: Duration(seconds: model.seconds),
      snackPosition: SnackPosition.BOTTOM,
      messageText: Container(),
      titleText: Text(
        model.msg,
        style: const TextStyle(fontSize: 14.0, color: Colors.white),
        overflow: TextOverflow.ellipsis,
        maxLines: 5,
      ),
      icon: Icon(
        model.type.icon,
        color: model.type.color,
      ),
    );
  }
}
