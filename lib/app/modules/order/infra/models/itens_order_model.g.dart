// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itens_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItensOrderModel _$ItensOrderModelFromJson(Map<String, dynamic> json) {
  return ItensOrderModel(
    id: json['id'] as String,
    amount: (json['amount'] as num).toDouble(),
    value: (json['value'] as num).toDouble(),
    total: (json['total'] as num).toDouble(),
    produtcId: json['produtcId'] as String,
    product: json['product'] == null
        ? null
        : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    orderId: json['orderId'] as String,
    createAt: json['createAt'] as String?,
    updateAt: json['updateAt'] as String?,
  );
}

Map<String, dynamic> _$ItensOrderModelToJson(ItensOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'value': instance.value,
      'total': instance.total,
      'produtcId': instance.produtcId,
      'product': instance.product?.toJson(),
      'orderId': instance.orderId,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };
