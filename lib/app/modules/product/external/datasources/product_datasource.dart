import 'dart:async';

import 'package:flutter_vendas/app/modules/product/infra/datasources/product_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/product/infra/models/product_model.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';

class ProductDatasource implements IProductDatasource {
  static const String URL_BASE = '/product';

  final ICustomConnect _customConnect;

  ProductDatasource(this._customConnect);

  @override
  Future<String> save(ProductModel value) async {
    var client = _customConnect.instance;

    var result = await client.post(
      '$URL_BASE/add',
      value.toJson(),
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return result.body;
  }

  @override
  Future<String> edit(ProductModel value) async {
    var client = _customConnect.instance;

    var result = await client.post(
      '$URL_BASE/edit',
      value.toJson(),
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return result.body;
  }

  @override
  Future<List<ProductModel>> getAll() async {
    var client = _customConnect.instance;

    var result = await client.get(
      '$URL_BASE/getAll',
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    List<dynamic> data = result.body;

    return data.map((v) => ProductModel.fromJson(v)).toList();
  }

  @override
  Future<ProductModel> getById(String id) async {
    var client = _customConnect.instance;

    var result = await client.get(
      '$URL_BASE/getById',
      query: {'id': id},
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return ProductModel.fromJson(result.body);
  }
}
