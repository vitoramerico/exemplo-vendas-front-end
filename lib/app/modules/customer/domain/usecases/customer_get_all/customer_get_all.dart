import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/customer/domain/repositories/customer_repository_interface.dart';

import 'customer_get_all_interface.dart';

class CustomerGetAll extends ICustomerGetAll {
  final ICustomerRepository _userRepository;

  CustomerGetAll(this._userRepository);

  @override
  Future<Either<CustomerError, List<CustomerEntity>>> call() {
    return _userRepository.getAll();
  }
}
