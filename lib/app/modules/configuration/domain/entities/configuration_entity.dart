class ConfigurationEntity {
  final bool isDakMode;
  final String localeLanguageCode;
  final String? localeCountryCode;

  ConfigurationEntity({
    required this.isDakMode,
    required this.localeLanguageCode,
    required this.localeCountryCode,
  });

  bool get isValid => localeLanguageCode.isNotEmpty;
}
