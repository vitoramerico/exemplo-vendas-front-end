import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/order/domain/repositories/order_repository_interface.dart';

import 'order_get_all_interface.dart';

class OrderGetAll extends IOrderGetAll {
  final IOrderRepository _orderRepository;

  OrderGetAll(this._orderRepository);

  @override
  Future<Either<OrderError, List<OrderEntity>>> call() {
    return _orderRepository.getAll();
  }
}
