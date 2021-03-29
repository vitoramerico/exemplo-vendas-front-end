import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/order/domain/repositories/order_repository_interface.dart';
import 'package:flutter_vendas/app/modules/order/infra/datasources/order_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/order/infra/models/order_model.dart';

class OrderRepository implements IOrderRepository {
  final IOrderDatasource _orderDatasource;

  OrderRepository(this._orderDatasource);

  @override
  Future<Either<OrderError, String>> save(OrderEntity value) async {
    try {
      var valueConvert = OrderModel.fromEntity(value);

      var result = await _orderDatasource.save(valueConvert);

      return Right(result);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<OrderError, String>> edit(OrderEntity value) async {
    try {
      var valueConvert = OrderModel.fromEntity(value);

      var result = await _orderDatasource.edit(valueConvert);

      return Right(result);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<OrderError, List<OrderEntity>>> getAll() async {
    try {
      var result = await _orderDatasource.getAll();

      var resultConvert = result.map((v) => v.toEntity()).toList();

      return Right(resultConvert);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<OrderError, OrderEntity>> getById(String id) async {
    try {
      var result = await _orderDatasource.getById(id);

      var resultConvert = result.toEntity();

      return Right(resultConvert);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }
}
