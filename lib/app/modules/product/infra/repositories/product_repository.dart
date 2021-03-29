import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_vendas/app/modules/product/infra/datasources/product_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/product/infra/models/product_model.dart';

class ProductRepository implements IProductRepository {
  final IProductDatasource _productDatasource;

  ProductRepository(this._productDatasource);

  @override
  Future<Either<ProductError, String>> save(ProductEntity value) async {
    try {
      var valueConvert = ProductModel.fromEntity(value);

      var result = await _productDatasource.save(valueConvert);

      return Right(result);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<ProductError, String>> edit(ProductEntity value) async {
    try {
      var valueConvert = ProductModel.fromEntity(value);

      var result = await _productDatasource.edit(valueConvert);

      return Right(result);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<ProductError, List<ProductEntity>>> getAll() async {
    try {
      var result = await _productDatasource.getAll();

      var resultConvert = result.map((v) => v.toEntity()).toList();

      return Right(resultConvert);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<ProductError, ProductEntity>> getById(String id) async {
    try {
      var result = await _productDatasource.getById(id);

      var resultConvert = result.toEntity();

      return Right(resultConvert);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }
}
