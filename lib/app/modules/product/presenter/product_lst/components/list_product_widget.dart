import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:flutter_vendas/app/shared/extensions/string_extension.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../product_lst_controller.dart';

class ListProductWidget extends StatelessWidget {
  final ProductLstController controller;

  const ListProductWidget({Key? key, required this.controller}) : super(key: key);

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

  Widget _buildSuccess(List<ProductEntity> lstValue) => DataTable(
        columns: _buildColumn(),
        rows: lstValue.map((v) => _buidRow(v)).toList(),
      );

  List<DataColumn> _buildColumn() => <DataColumn>[
        DataColumn(
          label: Text(
            'descricao'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'marca'.tr,
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
            'dtAlteracao'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ];

  DataRow _buidRow(ProductEntity value) => DataRow(
        cells: <DataCell>[
          DataCell(Text(value.description)),
          DataCell(Text(value.brand)),
          DataCell(Text(value.value.toString())),
          DataCell(
            Text(value.updateAt?.toDisplayDateTime ?? ' '),
            showEditIcon: true,
            onTap: () => controller.openProductAdd(id: value.id),
          ),
        ],
        onSelectChanged: controller.closeOnClick ? (v) => controller.clickRow(value) : null,
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
