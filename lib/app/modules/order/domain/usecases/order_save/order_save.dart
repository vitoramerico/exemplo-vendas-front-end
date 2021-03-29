import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/order/domain/repositories/order_repository_interface.dart';
import 'package:get/get.dart';

import 'order_save_interface.dart';

class OrderSave implements IOrderSave {
  final IOrderRepository _orderRepository;

  OrderSave(this._orderRepository);

  @override
  Future<Either<OrderError, String>> call(OrderEntity value) async {
    if (!value.isValid) return Left(ValidationError('camposInvalidos'.tr));

    if (value.id.isNotEmpty) return _orderRepository.edit(value);

    return _orderRepository.save(value);
  }
}
