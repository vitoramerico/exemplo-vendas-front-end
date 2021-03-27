import 'package:flutter_vendas/app/modules/configuration/domain/entities/configuration_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'configuration_model.g.dart';

@JsonSerializable()
class ConfigurationModel {
  final bool isDakMode;
  final String localeLanguageCode;
  final String? localeCountryCode;

  ConfigurationModel({
    required this.isDakMode,
    required this.localeLanguageCode,
    required this.localeCountryCode,
  });

  factory ConfigurationModel.fromEntity(ConfigurationEntity value) {
    return ConfigurationModel(
      isDakMode: value.isDakMode,
      localeLanguageCode: value.localeLanguageCode,
      localeCountryCode: value.localeCountryCode,
    );
  }

  ConfigurationEntity toEntity() {
    return ConfigurationEntity(
      isDakMode: this.isDakMode,
      localeLanguageCode: this.localeLanguageCode,
      localeCountryCode: this.localeCountryCode,
    );
  }

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) => _$ConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationModelToJson(this);
}
