import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../product_lst_controller.dart';

class ListProductMobileWidget extends StatelessWidget {
  final ProductLstController controller;

  const ListProductMobileWidget({Key? key, required this.controller}) : super(key: key);

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

  Widget _buildSuccess(List<ProductEntity> lstValue) => ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => _buidRow(lstValue[index]),
        itemCount: lstValue.length,
      );

  Widget _buidRow(ProductEntity value) => ListTile(
        title: Text(value.description),
        subtitle: Row(
          children: [
            Text('marca'.tr),
            const SizedBox(width: 5),
            Expanded(child: Text(value.brand)),
            Text('valor'.tr),
            const SizedBox(width: 5),
            Text(value.value.toString()),
          ],
        ),
        onTap: () {
          if (controller.closeOnClick)
            controller.clickRow(value);
          else
            controller.openProductAdd(id: value.id);
        },
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
