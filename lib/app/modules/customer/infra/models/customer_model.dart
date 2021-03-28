import 'package:flutter_vendas/app/modules/customer/domain/entities/customer_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel {
  final String id;
  final String name;
  final String email;
  final String cpf;
  final String? createAt;
  final String? updateAt;

  CustomerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.createAt,
    required this.updateAt,
  });

  factory CustomerModel.fromEntity(CustomerEntity value) {
    return CustomerModel(
      id: value.id,
      name: value.name,
      email: value.email,
      cpf: value.cpf,
      createAt: value.createAt,
      updateAt: value.updateAt,
    );
  }

  CustomerEntity toEntity() {
    return CustomerEntity(
      id: this.id,
      name: this.name,
      email: this.email,
      cpf: this.cpf,
      createAt: this.createAt,
      updateAt: this.updateAt,
    );
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
