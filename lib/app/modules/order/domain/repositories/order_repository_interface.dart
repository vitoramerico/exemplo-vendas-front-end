import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/errors/errors.dart';

abstract class IOrderRepository {
  Future<Either<OrderError, String>> save(OrderEntity value);
  Future<Either<OrderError, String>> edit(OrderEntity value);
  Future<Either<OrderError, List<OrderEntity>>> getAll();
  Future<Either<OrderError, OrderEntity>> getById(String id);
}
