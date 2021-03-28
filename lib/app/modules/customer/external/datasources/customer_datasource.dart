import 'dart:async';

import 'package:flutter_vendas/app/modules/customer/infra/datasources/customer_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/customer/infra/models/customer_model.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';

class CustomerDatasource implements ICustomerDatasource {
  static const String URL_BASE = '/customer';

  final ICustomConnect _customConnect;

  CustomerDatasource(this._customConnect);

  @override
  Future<String> save(CustomerModel value) async {
    var client = _customConnect.instance;

    var result = await client.post(
      '$URL_BASE/add',
      value.toJson(),
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return result.body;
  }

  @override
  Future<List<CustomerModel>> getAll() async {
    var client = _customConnect.instance;

    var result = await client.get(
      '$URL_BASE/getAll',
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    List<dynamic> data = result.body;

    return data.map((v) => CustomerModel.fromJson(v)).toList();
  }
}
