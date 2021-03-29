import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_get_all/order_get_all_interface.dart';
import 'package:flutter_vendas/app/shared/routes/app_pages.dart';
import 'package:get/get.dart';

class OrderLstController extends GetxController with StateMixin<List<OrderEntity>> {
  final IOrderGetAll _orderGetAll;

  OrderLstController(this._orderGetAll);

  @override
  void onInit() {
    super.onInit();
    _getData();
  }

  Future<void> _getData() async {
    var result = await _orderGetAll();

    result.fold((error) {
      change(null, status: RxStatus.error(error.message));
    }, (lstOrder) {
      change(lstOrder, status: lstOrder.isEmpty ? RxStatus.empty() : RxStatus.success());
    });
  }

  void openOrderAdd({String? id}) async {
    var url = Get.currentRoute + (id != null ? '/$id' : Routes.NEW);

    await Get.toNamed(url);

    _getData();
  }
}
