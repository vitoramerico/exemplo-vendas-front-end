import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/domain/errors/errors.dart';

abstract class ICustomerGetAll {
  Future<Either<CustomerError, List<CustomerEntity>>> call();
}
