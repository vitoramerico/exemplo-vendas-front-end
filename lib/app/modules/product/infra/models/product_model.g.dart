// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'] as String,
    description: json['description'] as String,
    brand: json['brand'] as String,
    value: (json['value'] as num).toDouble(),
    createAt: json['createAt'] as String?,
    updateAt: json['updateAt'] as String?,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'brand': instance.brand,
      'value': instance.value,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };
