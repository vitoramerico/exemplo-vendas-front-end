import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/usecases/product_get_all/product_get_all_interface.dart';
import 'package:flutter_vendas/app/shared/routes/app_pages.dart';
import 'package:get/get.dart';

class ProductLstController extends GetxController with StateMixin<List<ProductEntity>> {
  final IProductGetAll _productGetAll;

  bool closeOnClick = false;

  ProductLstController(this._productGetAll);

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
    var result = await _productGetAll();

    result.fold((error) {
      change(null, status: RxStatus.error(error.message));
    }, (lstProduct) {
      change(lstProduct, status: lstProduct.isEmpty ? RxStatus.empty() : RxStatus.success());
    });
  }

  void openProductAdd({String? id}) async {
    var url = Get.currentRoute + (id != null ? '/$id' : Routes.NEW);

    await Get.toNamed(url);

    _getData();
  }

  void clickRow(ProductEntity productEntity) {
    if (closeOnClick) Get.back(result: productEntity);
  }
}
