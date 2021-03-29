import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_vendas/app/modules/product/domain/errors/errors.dart';
import 'package:get/get.dart';

import 'product_save_interface.dart';

class ProductSave implements IProductSave {
  final IProductRepository _productRepository;

  ProductSave(this._productRepository);

  @override
  Future<Either<ProductError, String>> call(ProductEntity value) async {
    if (!value.isValid) return Left(ValidationError('camposInvalidos'.tr));

    if (value.id.isNotEmpty) return _productRepository.edit(value);

    return _productRepository.save(value);
  }
}
