import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order_add_controller.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final OrderAddController controller;

  const BottomNavigationBarWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.pageController,
      builder: (context, child) {
        return BottomNavigationBar(
          onTap: controller.changePage,
          currentIndex: controller.currentPage,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.assignment_ind),
              label: 'cliente'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.qr_code),
              label: 'produtos'.tr,
            ),
          ],
        );
      },
    );
  }
}
