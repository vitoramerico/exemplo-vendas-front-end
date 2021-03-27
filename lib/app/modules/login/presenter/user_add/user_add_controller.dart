import 'package:flutter_vendas/app/modules/login/domain/usecases/user_save/user_save_interface.dart';
import 'package:flutter_vendas/app/modules/login/presenter/user_add/user_add_store.dart';
import 'package:flutter_vendas/app/shared/components/my_snackbar.dart';
import 'package:flutter_vendas/app/shared/routes/app_pages.dart';
import 'package:get/get.dart';

class UserAddController extends GetxController {
  final IUserSave _userSave;

  final UserAddStore store;

  UserAddController(this._userSave, this.store);

  void save() async {
    var state = store.formkey.currentState;

    if (state == null || !state.validate()) return;

    state.save();

    var result = await _userSave(store.user);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (_) {
      Get.back();
      MySnackBar.show(MySnackBarModel(msg: 'cadastroRealizadoComSucesso'.tr));
    });
  }

  void openPageHome() => Get.toNamed(Routes.HOME);
}
