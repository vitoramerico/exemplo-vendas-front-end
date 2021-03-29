abstract class ProductError implements Exception {
  String get message => '';
}

class ValidationError implements ProductError {
  final String _message;

  ValidationError(this._message);

  @override
  String get message => _message;
}

class DatasourceError implements ProductError {
  final String _message;

  DatasourceError(this._message);

  @override
  String get message => _message;
}
