import 'package:flutter/material.dart';

import '../configuration_controller.dart';
import 'form_widget.dart';

class ContentWidget extends StatelessWidget {
  final ConfigurationController controller;
  final bool isMobile;

  const ContentWidget({
    Key? key,
    required this.controller,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMobile) return _buildMobile();

    return _buildLarger();
  }

  Widget _buildMobile() => FormWidget(
        controller: controller,
      );

  Widget _buildLarger() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              child: FormWidget(
                controller: controller,
              ),
            ),
          ),
        ],
      );
}
