import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_lst_controller.dart';

class OrderLstPage extends GetView<OrderLstController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta Pedidos')),
      body: Container(
        color: Colors.amberAccent,
      ),
    );
  }
}
