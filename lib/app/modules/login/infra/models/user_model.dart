import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String? createAt;
  final String? updateAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createAt,
    required this.updateAt,
  });

  factory UserModel.fromEntity(UserEntity value) {
    return UserModel(
      id: value.id,
      name: value.name,
      email: value.email,
      password: value.password,
      createAt: value.createAt,
      updateAt: value.updateAt,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: this.id,
      name: this.name,
      email: this.email,
      password: this.password,
      createAt: this.createAt,
      updateAt: this.updateAt,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
