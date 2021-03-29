import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/order/domain/repositories/order_repository_interface.dart';

import 'order_get_by_id_interface.dart';

class OrderGetById extends IOrderGetById {
  final IOrderRepository _orderRepository;

  OrderGetById(this._orderRepository);

  @override
  Future<Either<OrderError, OrderEntity>> call(String id) {
    return _orderRepository.getById(id);
  }
}
