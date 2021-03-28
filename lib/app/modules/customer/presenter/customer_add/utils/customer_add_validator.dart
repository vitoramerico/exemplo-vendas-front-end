import 'package:get/get.dart';

class CustomerAddValidator {
  static String? name(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    return null;
  }

  static String? email(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    if (!GetUtils.isEmail(v)) return 'campoInvalido'.tr;

    return null;
  }

  static String? cpf(String? v) {
    if (v == null || v.isEmpty) return 'campoObrigatorio'.tr;

    if (!GetUtils.isCpf(v)) return 'cpfInvalido'.tr;

    return null;
  }
}
