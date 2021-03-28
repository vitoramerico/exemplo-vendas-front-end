import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/domain/errors/errors.dart';

abstract class ICustomerRepository {
  Future<Either<CustomerError, String>> save(CustomerEntity value);
  Future<Either<CustomerError, String>> edit(CustomerEntity value);
  Future<Either<CustomerError, List<CustomerEntity>>> getAll();
  Future<Either<CustomerError, CustomerEntity>> getById(String id);
}
