import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:get/get.dart';

class CustomerAddStore extends GetxController {
  final formkey = GlobalKey<FormState>();

  final tecName = TextEditingController();
  final tecEmail = TextEditingController();
  final tecCpf = TextEditingController();

  final _id = ''.obs;
  set id(value) => this._id.value = value;
  get id => this._id.value;

  final _name = ''.obs;
  set name(value) => this._name.value = value;
  get name => this._name.value;

  final _email = ''.obs;
  set email(value) => this._email.value = value;
  get email => this._email.value;

  final _cpf = ''.obs;
  set cpf(value) => this._cpf.value = value;
  get cpf => this._cpf.value;

  set customer(CustomerEntity v) {
    id = v.id;
    name = v.name;
    email = v.email;
    cpf = v.cpf;
  }

  CustomerEntity get customer => CustomerEntity(
        id: id,
        name: name,
        email: email,
        cpf: cpf,
      );

  @override
  void onInit() {
    ever(_name, (String? v) => tecName.value = tecName.value.copyWith(text: v));
    ever(_email, (String? v) => tecEmail.value = tecEmail.value.copyWith(text: v));
    ever(_cpf, (String? v) => tecCpf.value = tecCpf.value.copyWith(text: v));

    super.onInit();
  }

  @override
  void onClose() {
    tecName.dispose();
    tecEmail.dispose();
    tecCpf.dispose();
    super.onClose();
  }
}
