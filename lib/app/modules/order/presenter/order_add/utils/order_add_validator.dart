import 'package:get/get.dart';

class OrderAddValidator {
  static String? customerDesc(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    return null;
  }

  static String? productDesc(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    return null;
  }

  static String? productAmount(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    if (double.parse(v) < 0) return 'campoInvalido'.tr;

    return null;
  }

  static String? productValue(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    if (double.parse(v) < 0) return 'campoInvalido'.tr;

    return null;
  }
}
