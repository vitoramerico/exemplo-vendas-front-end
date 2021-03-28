import '../../../../shared/entities/base_entity.dart';

class CustomerEntity extends BaseEntity {
  final String name;
  final String email;
  final String cpf;

  CustomerEntity({
    required String id,
    required this.name,
    required this.email,
    required this.cpf,
    String? createAt,
    String? updateAt,
  }) : super(
          id: id,
          createAt: createAt,
          updateAt: updateAt,
        );

  bool get isValid => name.isNotEmpty && email.isNotEmpty && cpf.isNotEmpty;
}
