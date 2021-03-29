import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/itens_order_entity.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:flutter_vendas/app/modules/product/domain/entities/product_entity.dart';
import 'package:get/get.dart';

class OrderAddStore extends GetxController {
  final formkey = GlobalKey<FormState>();
  final formProductkey = GlobalKey<FormState>();

  final tecId = TextEditingController();
  final tecNote = TextEditingController();
  final tecCustomerDesc = TextEditingController();
  final tecProductDesc = TextEditingController();
  final tecProductAmount = TextEditingController();
  final tecProductValue = TextEditingController();
  final tecProductTotal = TextEditingController();

  final _id = ''.obs;
  set id(value) => this._id.value = value;
  get id => this._id.value;

  final _note = ''.obs;
  set note(value) => this._note.value = value;
  get note => this._note.value;

  final _customer = Rx<CustomerEntity>(null);
  set customer(value) => this._customer.value = value;
  get customer => this._customer.value;

  final _product = Rx<ProductEntity>(null);
  set product(value) => this._product.value = value;
  get product => this._product.value;

  final _productId = ''.obs;
  set productId(value) => this._productId.value = value;
  get productId => this._productId.value;

  final _productDesc = ''.obs;
  set productDesc(value) => this._productDesc.value = value;
  get productDesc => this._productDesc.value;

  final _productAmount = 0.0.obs;
  set productAmount(value) => this._productAmount.value = value;
  get productAmount => this._productAmount.value;

  final _productValue = 0.0.obs;
  set productValue(value) => this._productValue.value = value;
  get productValue => this._productValue.value;

  get productTotal => productAmount * productValue;

  final _lstItensOrder = <ItensOrderEntity>[].obs;
  List<ItensOrderEntity> get lstItensOrder => _lstItensOrder;

  ItensOrderEntity get itensOrder => ItensOrderEntity(
        id: '',
        amount: productAmount,
        value: productValue,
        total: productTotal,
        produtcId: productId,
        product: product,
        orderId: '',
      );

  set order(OrderEntity v) {
    id = v.id;
    note = v.note;
    customer = v.customer;
    lstItensOrder.assignAll(v.itens);
  }

  OrderEntity get order => OrderEntity(
        id: id,
        note: note,
        customerId: customer.id,
        customer: customer,
        itens: lstItensOrder,
      );

  @override
  void onInit() {
    ever(_id, (String? v) => tecId.value = tecId.value.copyWith(text: v));
    ever(_note, (String? v) => tecNote.value = tecNote.value.copyWith(text: v));
    ever(
      _customer,
      (CustomerEntity? v) => tecCustomerDesc.value = tecCustomerDesc.value.copyWith(text: v?.name),
    );
    ever(_productDesc, (String? v) => tecProductDesc.value = tecProductDesc.value.copyWith(text: v));
    everAll([_productAmount, _productValue], (_) {
      tecProductTotal.value = tecProductTotal.value.copyWith(text: productTotal?.toString());
    });
    ever(_product, (ProductEntity? v) {
      if (v == null) {
        tecProductDesc.clear();
        tecProductAmount.clear();
        tecProductValue.clear();
        tecProductTotal.clear();
        return;
      }

      productId = v.id;
      productDesc = v.description;
      productAmount = 1.0;
      productValue = v.value;

      tecProductAmount.text = '1';
      tecProductValue.text = v.value.toString();
    });

    super.onInit();
  }

  @override
  void onClose() {
    tecId.dispose();
    tecNote.dispose();
    tecCustomerDesc.dispose();
    tecProductDesc.dispose();
    tecProductAmount.dispose();
    tecProductValue.dispose();
    tecProductTotal.dispose();
    super.onClose();
  }
}
