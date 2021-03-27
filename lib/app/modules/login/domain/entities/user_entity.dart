import '../../../../shared/entities/base_entity.dart';

class UserEntity extends BaseEntity {
  final String name;
  final String email;
  final String password;

  UserEntity({
    required String id,
    required this.name,
    required this.email,
    required this.password,
    String? createAt,
    String? updateAt,
  }) : super(
          id: id,
          createAt: createAt,
          updateAt: updateAt,
        );

  bool get isValid => name.isNotEmpty && email.isNotEmpty && password.isNotEmpty && password.length >= 6;
}
