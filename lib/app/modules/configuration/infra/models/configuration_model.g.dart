// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurationModel _$ConfigurationModelFromJson(Map<String, dynamic> json) {
  return ConfigurationModel(
    isDakMode: json['isDakMode'] as bool,
    localeLanguageCode: json['localeLanguageCode'] as String,
    localeCountryCode: json['localeCountryCode'] as String,
  );
}

Map<String, dynamic> _$ConfigurationModelToJson(ConfigurationModel instance) =>
    <String, dynamic>{
      'isDakMode': instance.isDakMode,
      'localeLanguageCode': instance.localeLanguageCode,
      'localeCountryCode': instance.localeCountryCode,
    };
