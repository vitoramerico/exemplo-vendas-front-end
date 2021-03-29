import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:get/get.dart';

class ProductAddStore extends GetxController {
  final formkey = GlobalKey<FormState>();

  final tecDescription = TextEditingController();
  final tecBrand = TextEditingController();
  final tecValue = TextEditingController();

  final _id = ''.obs;
  set id(value) => this._id.value = value;
  get id => this._id.value;

  final _description = ''.obs;
  set description(value) => this._description.value = value;
  get description => this._description.value;

  final _brand = ''.obs;
  set brand(value) => this._brand.value = value;
  get brand => this._brand.value;

  final _value = 0.0.obs;
  set value(value) => this._value.value = value;
  get value => this._value.value;

  set product(ProductEntity v) {
    id = v.id;
    description = v.description;
    brand = v.brand;
    value = v.value;
  }

  ProductEntity get product => ProductEntity(
        id: id,
        description: description,
        brand: brand,
        value: value,
      );

  @override
  void onInit() {
    ever(_description, (String? v) => tecDescription.value = tecDescription.value.copyWith(text: v));
    ever(_brand, (String? v) => tecBrand.value = tecBrand.value.copyWith(text: v));
    ever(_value, (double? v) => tecValue.value = tecValue.value.copyWith(text: v?.toString()));

    super.onInit();
  }

  @override
  void onClose() {
    tecDescription.dispose();
    tecBrand.dispose();
    tecValue.dispose();
    super.onClose();
  }
}
