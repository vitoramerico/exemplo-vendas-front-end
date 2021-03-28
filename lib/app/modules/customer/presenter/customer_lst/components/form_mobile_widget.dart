import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_lst/customer_lst_controller.dart';
import 'package:flutter_vendas/app/shared/extensions/string_extension.dart';

class FormMobileWidget extends StatelessWidget {
  final CustomerLstController controller;

  const FormMobileWidget({Key? key, required this.controller}) : super(key: key);

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

  Widget _buildSuccess(List<CustomerEntity> lstValue) => ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => _buidRow(lstValue[index]),
        itemCount: lstValue.length,
      );

  Widget _buidRow(CustomerEntity value) => ListTile(
        title: Text(value.name),
        subtitle: Row(
          children: [
            Text('cpf'.tr),
            const SizedBox(width: 5),
            Expanded(child: Text(value.cpf)),
            Text('dtCadastro'.tr),
            const SizedBox(width: 5),
            Text(value.createAt?.toDisplayDateTime ?? ' '),
          ],
        ),
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
