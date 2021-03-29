import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';

import '../../../../shared/entities/base_entity.dart';
import 'itens_order_entity.dart';

class OrderEntity extends BaseEntity {
  final String note;
  final String customerId;
  final CustomerEntity customer;
  final List<ItensOrderEntity> itens;

  OrderEntity({
    required String id,
    required this.note,
    required this.customerId,
    required this.customer,
    required this.itens,
    String? createAt,
    String? updateAt,
  }) : super(
          id: id,
          createAt: createAt,
          updateAt: updateAt,
        );

  bool get isValid => customerId.isNotEmpty && itens.isNotEmpty;

  double get vlrTotal => itens.fold(0, (previousValue, v) => previousValue + v.total);
}
