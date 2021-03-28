import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/customer/domain/repositories/customer_repository_interface.dart';
import 'package:flutter_vendas/app/modules/customer/infra/datasources/customer_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/customer/infra/models/customer_model.dart';

class CustomerRepository implements ICustomerRepository {
  final ICustomerDatasource _customerDatasource;

  CustomerRepository(this._customerDatasource);

  @override
  Future<Either<CustomerError, String>> save(CustomerEntity value) async {
    try {
      var valueConvert = CustomerModel.fromEntity(value);

      var result = await _customerDatasource.save(valueConvert);

      return Right(result);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<CustomerError, String>> edit(CustomerEntity value) async {
    try {
      var valueConvert = CustomerModel.fromEntity(value);

      var result = await _customerDatasource.edit(valueConvert);

      return Right(result);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<CustomerError, List<CustomerEntity>>> getAll() async {
    try {
      var result = await _customerDatasource.getAll();

      var resultConvert = result.map((v) => v.toEntity()).toList();

      return Right(resultConvert);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<CustomerError, CustomerEntity>> getById(String id) async {
    try {
      var result = await _customerDatasource.getById(id);

      var resultConvert = result.toEntity();

      return Right(resultConvert);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }
}
