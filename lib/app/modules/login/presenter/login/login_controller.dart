import 'package:flutter_vendas/app/modules/login/domain/usecases/user_login/user_login_interface.dart';
import 'package:flutter_vendas/app/shared/components/my_snackbar.dart';
import 'package:flutter_vendas/app/shared/routes/app_pages.dart';
import 'package:flutter_vendas/app/shared/store/shared_store.dart';
import 'package:get/get.dart';

import 'login_store.dart';

class LoginController extends GetxController {
  final IUserLogin _userLogin;

  final SharedStore sharedStore;
  final LoginStore store;

  LoginController(this._userLogin, this.store, this.sharedStore);

  void login() async {
    var state = store.formkey.currentState;

    if (state == null || !state.validate()) return;

    state.save();

    var result = await _userLogin(store.login, store.password);

    result.fold((error) {
      print(error.message);
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (user) {
      sharedStore.user = user;
      Get.offNamed(Routes.HOME);
    });
  }

  void openPageHome() => Get.toNamed(Routes.HOME);

  void openUserAdd() => Get.toNamed(Routes.USER + Routes.NEW);
}
