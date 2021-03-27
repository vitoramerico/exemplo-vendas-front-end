abstract class ConfigurationError implements Exception {
  String get message => '';
}

class ValidationError implements ConfigurationError {
  final String _message;

  ValidationError(this._message);

  @override
  String get message => _message;
}

class DatasourceError implements ConfigurationError {
  final String _message;

  DatasourceError(this._message);

  @override
  String get message => _message;
}
