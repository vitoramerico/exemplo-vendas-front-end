import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/customer/domain/repositories/customer_repository_interface.dart';
import 'package:get/get.dart';

import 'customer_save_interface.dart';

class CustomerSave implements ICustomerSave {
  final ICustomerRepository _customerRepository;

  CustomerSave(this._customerRepository);

  @override
  Future<Either<CustomerError, String>> call(CustomerEntity value) async {
    if (!value.isValid) return Left(ValidationError('camposInvalidos'.tr));

    return _customerRepository.save(value);
  }
}
