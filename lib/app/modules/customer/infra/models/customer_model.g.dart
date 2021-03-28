// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return CustomerModel(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    cpf: json['cpf'] as String,
    createAt: json['createAt'] as String?,
    updateAt: json['updateAt'] as String?,
  );
}

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'cpf': instance.cpf,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };
