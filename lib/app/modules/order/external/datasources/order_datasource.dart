import 'dart:async';

import 'package:flutter_vendas/app/modules/order/infra/datasources/order_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/order/infra/models/order_model.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';

class OrderDatasource implements IOrderDatasource {
  static const String URL_BASE = '/order';

  final ICustomConnect _customConnect;

  OrderDatasource(this._customConnect);

  @override
  Future<String> save(OrderModel value) async {
    var client = _customConnect.instance;

    var result = await client.post(
      '$URL_BASE/add',
      value.toJson(),
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return result.body;
  }

  @override
  Future<String> edit(OrderModel value) async {
    var client = _customConnect.instance;

    var result = await client.post(
      '$URL_BASE/edit',
      value.toJson(),
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return result.body;
  }

  @override
  Future<List<OrderModel>> getAll() async {
    var client = _customConnect.instance;

    var result = await client.get(
      '$URL_BASE/getAll',
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    List<dynamic> data = result.body;

    return data.map((v) => OrderModel.fromJson(v)).toList();
  }

  @override
  Future<OrderModel> getById(String id) async {
    var client = _customConnect.instance;

    var result = await client.get(
      '$URL_BASE/getById',
      query: {'id': id},
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return OrderModel.fromJson(result.body);
  }
}
