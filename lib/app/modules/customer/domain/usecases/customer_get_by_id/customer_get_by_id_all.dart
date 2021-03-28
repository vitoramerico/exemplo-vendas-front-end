import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/customer/domain/repositories/customer_repository_interface.dart';

import 'customer_get_by_id_interface.dart';

class CustomerGetById extends ICustomerGetById {
  final ICustomerRepository _userRepository;

  CustomerGetById(this._userRepository);

  @override
  Future<Either<CustomerError, CustomerEntity>> call(String id) {
    return _userRepository.getById(id);
  }
}
