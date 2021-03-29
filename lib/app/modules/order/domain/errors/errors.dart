abstract class OrderError implements Exception {
  String get message => '';
}

class ValidationError implements OrderError {
  final String _message;

  ValidationError(this._message);

  @override
  String get message => _message;
}

class DatasourceError implements OrderError {
  final String _message;

  DatasourceError(this._message);

  @override
  String get message => _message;
}
