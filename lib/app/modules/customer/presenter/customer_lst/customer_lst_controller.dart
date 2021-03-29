import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_get_all/customer_get_all_interface.dart';
import 'package:flutter_vendas/app/shared/routes/app_pages.dart';
import 'package:get/get.dart';

class CustomerLstController extends GetxController with StateMixin<List<CustomerEntity>> {
  final ICustomerGetAll _customerGetAll;

  bool closeOnClick = false;

  CustomerLstController(this._customerGetAll);

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    closeOnClick = Get.arguments ?? false;

    _getData();
  }

  Future<void> _getData() async {
    var result = await _customerGetAll();

    result.fold((error) {
      change(null, status: RxStatus.error(error.message));
    }, (lstCustomer) {
      change(lstCustomer, status: lstCustomer.isEmpty ? RxStatus.empty() : RxStatus.success());
    });
  }

  void openCustomerAdd({String? id}) async {
    var url = Get.currentRoute + (id != null ? '/$id' : Routes.NEW);

    await Get.toNamed(url);

    _getData();
  }

  void clickRow(CustomerEntity customerEntity) {
    if (closeOnClick) Get.back(result: customerEntity);
  }
}
