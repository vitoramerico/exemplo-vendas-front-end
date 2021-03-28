import 'package:flutter_vendas/app/modules/customer/infra/models/customer_model.dart';

abstract class ICustomerDatasource {
  Future<String> save(CustomerModel value);
  Future<List<CustomerModel>> getAll();
}
