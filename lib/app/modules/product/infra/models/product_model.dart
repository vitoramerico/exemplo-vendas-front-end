import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String id;
  final String description;
  final String brand;
  final double value;
  final String? createAt;
  final String? updateAt;

  ProductModel({
    required this.id,
    required this.description,
    required this.brand,
    required this.value,
    required this.createAt,
    required this.updateAt,
  });

  factory ProductModel.fromEntity(ProductEntity value) {
    return ProductModel(
      id: value.id,
      description: value.description,
      brand: value.brand,
      value: value.value,
      createAt: value.createAt,
      updateAt: value.updateAt,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: this.id,
      description: this.description,
      brand: this.brand,
      value: this.value,
      createAt: this.createAt,
      updateAt: this.updateAt,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
