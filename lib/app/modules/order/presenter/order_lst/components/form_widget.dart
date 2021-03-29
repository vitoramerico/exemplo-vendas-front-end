import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/shared/extensions/string_extension.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../order_lst_controller.dart';

class FormWidget extends StatelessWidget {
  final OrderLstController controller;

  const FormWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: controller.obx(
        (value) => _buildSuccess(value ?? []),
        onEmpty: _buildEmpty(context),
        onError: (error) => _buildError(error ?? ''),
      ),
    );
  }

  Widget _buildSuccess(List<OrderEntity> lstValue) => DataTable(
        columns: _buildColumn(),
        rows: lstValue.map((v) => _buidRow(v)).toList(),
      );

  List<DataColumn> _buildColumn() => <DataColumn>[
        DataColumn(
          label: Text(
            'Cliente'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'observacao'.tr,
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
            'dtAlteracao'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ];

  DataRow _buidRow(OrderEntity value) => DataRow(
        cells: <DataCell>[
          DataCell(Text(value.customer.name)),
          DataCell(Text(value.note)),
          DataCell(Text(value.vlrTotal.toString())),
          DataCell(
            Text(value.updateAt?.toDisplayDateTime ?? ' '),
            showEditIcon: true,
            onTap: () => controller.openOrderAdd(id: value.id),
          ),
        ],
      );

  Widget _buildError(String error) => Center(
        child: Text(
          error,
          style: const TextStyle(color: Colors.red),
        ),
      );

  Widget _buildEmpty(BuildContext context) => Center(
        child: Text(
          'nenhumResultadoEncontrado'.tr,
          style: Theme.of(context).textTheme.headline5,
        ),
      );
}
