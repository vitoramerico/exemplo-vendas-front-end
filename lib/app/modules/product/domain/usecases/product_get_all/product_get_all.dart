import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/product/domain/repositories/product_repository_interface.dart';

import 'product_get_all_interface.dart';

class ProductGetAll extends IProductGetAll {
  final IProductRepository _productRepository;

  ProductGetAll(this._productRepository);

  @override
  Future<Either<ProductError, List<ProductEntity>>> call() {
    return _productRepository.getAll();
  }
}
