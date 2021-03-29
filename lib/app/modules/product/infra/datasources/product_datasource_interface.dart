import 'package:flutter_vendas/app/modules/product/infra/models/product_model.dart';

abstract class IProductDatasource {
  Future<String> save(ProductModel value);
  Future<String> edit(ProductModel value);
  Future<List<ProductModel>> getAll();
  Future<ProductModel> getById(String id);
}
