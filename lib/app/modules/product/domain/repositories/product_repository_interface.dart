import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/errors/errors.dart';

abstract class IProductRepository {
  Future<Either<ProductError, String>> save(ProductEntity value);
  Future<Either<ProductError, String>> edit(ProductEntity value);
  Future<Either<ProductError, List<ProductEntity>>> getAll();
  Future<Either<ProductError, ProductEntity>> getById(String id);
}
