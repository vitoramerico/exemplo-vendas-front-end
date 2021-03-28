import 'package:flutter_vendas/app/modules/customer/infra/models/customer_model.dart';

abstract class ICustomerDatasource {
  Future<String> save(CustomerModel value);
  Future<String> edit(CustomerModel value);
  Future<List<CustomerModel>> getAll();
  Future<CustomerModel> getById(String id);
}
