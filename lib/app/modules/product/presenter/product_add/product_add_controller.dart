import 'package:flutter_vendas/app/modules/product/domain/usecases/product_get_by_id/product_get_by_id_interface.dart';
import 'package:flutter_vendas/app/modules/product/domain/usecases/product_save/product_save_interface.dart';
import 'package:flutter_vendas/app/shared/components/my_snackbar.dart';
import 'package:get/get.dart';

import 'product_add_store.dart';

class ProductAddController extends GetxController {
  final IProductSave _productSave;
  final IProductGetById _productGetById;

  final ProductAddStore store;

  ProductAddController(this._productSave, this._productGetById, this.store);

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    var id = Get.parameters['id'];

    if (id == null) return;

    var result = await _productGetById(id);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (product) {
      store.product = product;
    });
  }

  void save() async {
    var state = store.formkey.currentState;

    if (state == null || !state.validate()) return;

    state.save();

    var result = await _productSave(store.product);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (_) {
      Get.back();
      MySnackBar.show(MySnackBarModel(msg: 'cadastroRealizadoComSucesso'.tr));
    });
  }
}
