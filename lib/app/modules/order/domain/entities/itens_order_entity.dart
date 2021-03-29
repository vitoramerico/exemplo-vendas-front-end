import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';

import '../../../../shared/entities/base_entity.dart';

class ItensOrderEntity extends BaseEntity {
  final double amount;
  final double value;
  final double total;
  final String produtcId;
  final ProductEntity? product;
  final String orderId;

  ItensOrderEntity({
    required String id,
    required this.amount,
    required this.value,
    required this.total,
    required this.produtcId,
    required this.product,
    required this.orderId,
    String? createAt,
    String? updateAt,
  }) : super(
          id: id,
          createAt: createAt,
          updateAt: updateAt,
        );

  bool get isValid => amount > 0 && value > 0 && total > 0 && produtcId.isNotEmpty && orderId.isNotEmpty;
}
