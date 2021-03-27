import 'package:get/get.dart';

class UserAddValidator {
  static String? name(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    return null;
  }

  static String? email(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    if (!GetUtils.isEmail(v)) return 'campoInvalido'.tr;

    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    if (GetUtils.isLengthLessThan(v, 6)) return 'senhaNaoDeveSerMenorDigitos'.trParams({'digitos': '6'});

    return null;
  }
}
