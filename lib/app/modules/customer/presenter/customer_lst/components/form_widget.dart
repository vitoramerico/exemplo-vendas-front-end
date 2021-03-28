import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_lst/customer_lst_controller.dart';
import 'package:flutter_vendas/app/shared/extensions/string_extension.dart';

class FormWidget extends StatelessWidget {
  final CustomerLstController controller;

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

  Widget _buildSuccess(List<CustomerEntity> lstValue) => DataTable(
        columns: _buildColumn(),
        rows: lstValue.map((v) => _buidRow(v)).toList(),
      );

  List<DataColumn> _buildColumn() => <DataColumn>[
        DataColumn(
          label: Text(
            'cpf'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'nome'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'dtCadastro'.tr,
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

  DataRow _buidRow(CustomerEntity value) => DataRow(
        cells: <DataCell>[
          DataCell(Text(value.cpf)),
          DataCell(Text(value.name)),
          DataCell(Text(value.createAt?.toDisplayDateTime ?? ' ')),
          DataCell(
            Text(value.updateAt?.toDisplayDateTime ?? ' '),
            showEditIcon: true,
            onTap: () => controller.openCustomerAdd(id: value.id),
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
