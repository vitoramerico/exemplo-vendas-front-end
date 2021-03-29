import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/errors/errors.dart';

abstract class IProductGetById {
  Future<Either<ProductError, ProductEntity>> call(String id);
}
