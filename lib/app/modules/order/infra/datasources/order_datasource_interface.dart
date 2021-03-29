import 'package:flutter_vendas/app/modules/order/infra/models/order_model.dart';

abstract class IOrderDatasource {
  Future<String> save(OrderModel value);
  Future<String> edit(OrderModel value);
  Future<List<OrderModel>> getAll();
  Future<OrderModel> getById(String id);
}
