import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'custom_connect_interface.dart';

class CustomConnect extends GetConnect implements ICustomConnect {
  @override
  void onInit() {
    var urlBase = env['SERVER_URL'];

    httpClient.baseUrl = urlBase;
    httpClient.timeout = const Duration(seconds: 3);
  }

  @override
  GetConnect get instance => this;
}
