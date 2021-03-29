import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/itens_order_entity.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/order_add_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ListItensOrderWidget extends StatelessWidget {
  final OrderAddController controller;

  const ListItensOrderWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: controller.obx(
        (value) => _buildSuccess(value ?? []),
        onError: (error) => _buildError(error ?? ''),
      ),
    );
  }

  Widget _buildSuccess(List<ItensOrderEntity> lstValue) => DataTable(
        columns: _buildColumn(),
        rows: lstValue.map((v) => _buidRow(v)).toList(),
      );

  List<DataColumn> _buildColumn() => <DataColumn>[
        DataColumn(
          label: Text(
            'produto'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'quantidade'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'valor'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'total'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Excluir',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ];

  DataRow _buidRow(ItensOrderEntity value) => DataRow(
        cells: <DataCell>[
          DataCell(Text(value.product?.description ?? ' ')),
          DataCell(Text(value.amount.toString())),
          DataCell(Text(value.value.toString())),
          DataCell(Text(value.total.toString())),
          DataCell(
            const Icon(Icons.delete, color: Colors.red),
            onTap: () => controller.removeItem(value),
          ),
        ],
      );

  Widget _buildError(String error) => Center(
        child: Text(
          error,
          style: const TextStyle(color: Colors.red),
        ),
      );
}
