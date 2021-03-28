import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_get_by_id/customer_get_by_id_interface.dart';
import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_save/customer_save_interface.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_add/customer_add_store.dart';
import 'package:flutter_vendas/app/shared/components/my_snackbar.dart';
import 'package:get/get.dart';

class CustomerAddController extends GetxController {
  final ICustomerSave _customerSave;
  final ICustomerGetById _customerGetById;

  final CustomerAddStore store;

  CustomerAddController(this._customerSave, this._customerGetById, this.store);

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    var id = Get.parameters['id'];

    if (id == null) return;

    var result = await _customerGetById(id);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (customer) {
      store.customer = customer;
    });
  }

  void save() async {
    var state = store.formkey.currentState;

    if (state == null || !state.validate()) return;

    state.save();

    var result = await _customerSave(store.customer);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (_) {
      Get.back();
      MySnackBar.show(MySnackBarModel(msg: 'cadastroRealizadoComSucesso'.tr));
    });
  }
}
