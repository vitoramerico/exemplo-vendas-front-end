import 'package:flutter_vendas/app/modules/order/domain/entities/itens_order_entity.dart';
import 'package:flutter_vendas/app/modules/product/infra/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itens_order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItensOrderModel {
  final String id;
  final double amount;
  final double value;
  final double total;
  final String produtcId;
  final ProductModel? product;
  final String orderId;
  final String? createAt;
  final String? updateAt;

  ItensOrderModel({
    required this.id,
    required this.amount,
    required this.value,
    required this.total,
    required this.produtcId,
    required this.product,
    required this.orderId,
    required this.createAt,
    required this.updateAt,
  });

  factory ItensOrderModel.fromEntity(ItensOrderEntity value) {
    var product = value.product;

    return ItensOrderModel(
      id: value.id,
      amount: value.amount,
      value: value.value,
      total: value.total,
      produtcId: value.produtcId,
      product: product != null ? ProductModel.fromEntity(product) : null,
      orderId: value.orderId,
      createAt: value.createAt,
      updateAt: value.updateAt,
    );
  }

  ItensOrderEntity toEntity() {
    return ItensOrderEntity(
      id: this.id,
      amount: this.amount,
      value: this.value,
      total: this.total,
      produtcId: this.produtcId,
      product: this.product?.toEntity(),
      orderId: this.orderId,
      createAt: this.createAt,
      updateAt: this.updateAt,
    );
  }

  factory ItensOrderModel.fromJson(Map<String, dynamic> json) => _$ItensOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItensOrderModelToJson(this);
}
