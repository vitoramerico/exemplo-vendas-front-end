import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/product/domain/repositories/product_repository_interface.dart';

import 'product_get_by_id_interface.dart';

class ProductGetById extends IProductGetById {
  final IProductRepository _productRepository;

  ProductGetById(this._productRepository);

  @override
  Future<Either<ProductError, ProductEntity>> call(String id) {
    return _productRepository.getById(id);
  }
}
