class BaseEntity {
  final String id;
  final String? createAt;
  final String? updateAt;

  BaseEntity({
    required this.id,
    this.createAt,
    this.updateAt,
  });
}
