import 'package:get/get.dart';

class ProductAddValidator {
  static String? description(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    return null;
  }

  static String? brand(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    return null;
  }

  static String? value(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    if (double.parse(v) < 0.0) return 'cpfInvalido'.tr;

    return null;
  }
}
