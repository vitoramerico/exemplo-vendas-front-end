import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_save/customer_save_interface.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_add/customer_add_store.dart';
import 'package:flutter_vendas/app/shared/components/my_snackbar.dart';
import 'package:get/get.dart';

class CustomerAddController extends GetxController {
  final ICustomerSave _customerSave;

  final CustomerAddStore store;

  CustomerAddController(this._customerSave, this.store);

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    var id = Get.parameters['id'];

    print(id);
  }

  void save() async {
    var state = store.formkey.currentState;

    if (state == null || !state.validate()) return;

    state.save();

    var result = await _customerSave(store.user);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (_) {
      Get.back();
      MySnackBar.show(MySnackBarModel(msg: 'cadastroRealizadoComSucesso'.tr));
    });
  }
}
