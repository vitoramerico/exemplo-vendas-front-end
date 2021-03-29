// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    id: json['id'] as String,
    note: json['note'] as String,
    customerId: json['customerId'] as String,
    customer: CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
    itens: (json['itens'] as List<dynamic>)
        .map((e) => ItensOrderModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    createAt: json['createAt'] as String?,
    updateAt: json['updateAt'] as String?,
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'customerId': instance.customerId,
      'customer': instance.customer.toJson(),
      'itens': instance.itens.map((e) => e.toJson()).toList(),
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };
