import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/itens_order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_get_by_id/order_get_by_id_interface.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_save/order_save_interface.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/shared/components/my_snackbar.dart';
import 'package:flutter_vendas/app/shared/routes/app_pages.dart';
import 'package:get/get.dart';

import 'order_add_store.dart';

class OrderAddController extends GetxController with StateMixin<List<ItensOrderEntity>> {
  final IOrderSave _orderSave;
  final IOrderGetById _orderGetById;

  final OrderAddStore store;

  final pageController = PageController();

  int get currentPage => pageController.page?.round() ?? 0;

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  OrderAddController(this._orderSave, this._orderGetById, this.store);

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    var id = Get.parameters['id'];

    if (id == null) {
      change(store.lstItensOrder, status: RxStatus.empty());
      return;
    }

    var result = await _orderGetById(id);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
      change(null, status: RxStatus.error(error.message));
    }, (order) {
      store.order = order;
      change(order.itens, status: order.itens.isEmpty ? RxStatus.empty() : RxStatus.success());
    });
  }

  void addItem() async {
    var state = store.formProductkey.currentState;

    if (state == null || !state.validate()) return;

    state.save();

    store.lstItensOrder.add(store.itensOrder);

    //clearProduct();
    store.product = null;
    change(store.lstItensOrder, status: RxStatus.success());

    MySnackBar.show(MySnackBarModel(msg: 'itemAdicionadoComSucesso'.tr));
  }

  void removeItem(ItensOrderEntity itensOrderEntity) async {
    store.lstItensOrder.remove(itensOrderEntity);
    change(store.lstItensOrder, status: RxStatus.success());

    MySnackBar.show(MySnackBarModel(msg: 'itemRemovidoComSucesso'.tr));
  }

  void clearProduct() {
    store.tecProductDesc.clear();
    store.tecProductAmount.clear();
    store.tecProductValue.clear();
    store.tecProductTotal.clear();
  }

  void save() async {
    var state = store.formkey.currentState;

    if (state == null || !state.validate()) return;

    state.save();

    var result = await _orderSave(store.order);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (_) {
      Get.back();
      MySnackBar.show(MySnackBarModel(msg: 'cadastroRealizadoComSucesso'.tr));
    });
  }

  void openCustomerLst() async {
    var result = await Get.toNamed(Routes.HOME + Routes.CUSTOMER, arguments: true);

    if (result != null && result is CustomerEntity) {
      store.customer = result;
    }
  }

  void openProductLst() async {
    var result = await Get.toNamed(Routes.HOME + Routes.PRODUCT, arguments: true);

    if (result != null && result is ProductEntity) {
      store.product = result;
    }
  }
}
