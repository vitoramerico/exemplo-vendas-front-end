import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/errors/errors.dart';

abstract class IOrderGetById {
  Future<Either<OrderError, OrderEntity>> call(String id);
}
