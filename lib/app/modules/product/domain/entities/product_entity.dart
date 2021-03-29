import '../../../../shared/entities/base_entity.dart';

class ProductEntity extends BaseEntity {
  final String description;
  final String brand;
  final double value;

  ProductEntity({
    required String id,
    required this.description,
    required this.brand,
    required this.value,
    String? createAt,
    String? updateAt,
  }) : super(
          id: id,
          createAt: createAt,
          updateAt: updateAt,
        );

  bool get isValid => description.isNotEmpty && brand.isNotEmpty && value > 0;
}
