import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/errors/errors.dart';

abstract class IProductGetAll {
  Future<Either<ProductError, List<ProductEntity>>> call();
}
