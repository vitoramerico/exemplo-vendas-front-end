import 'package:flutter_vendas/app/modules/customer/infra/models/customer_model.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'itens_order_model.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  final String id;
  final String note;
  final String customerId;
  final CustomerModel customer;
  final List<ItensOrderModel> itens;
  final String? createAt;
  final String? updateAt;

  OrderModel({
    required this.id,
    required this.note,
    required this.customerId,
    required this.customer,
    required this.itens,
    required this.createAt,
    required this.updateAt,
  });

  factory OrderModel.fromEntity(OrderEntity value) {
    return OrderModel(
      id: value.id,
      note: value.note,
      customerId: value.customerId,
      customer: CustomerModel.fromEntity(value.customer),
      itens: value.itens.map((v) => ItensOrderModel.fromEntity(v)).toList(),
      createAt: value.createAt,
      updateAt: value.updateAt,
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: this.id,
      note: this.note,
      customerId: this.customerId,
      customer: this.customer.toEntity(),
      itens: this.itens.map((v) => v.toEntity()).toList(),
      createAt: this.createAt,
      updateAt: this.updateAt,
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
