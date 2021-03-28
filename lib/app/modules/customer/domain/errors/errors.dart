abstract class CustomerError implements Exception {
  String get message => '';
}

class ValidationError implements CustomerError {
  final String _message;

  ValidationError(this._message);

  @override
  String get message => _message;
}

class DatasourceError implements CustomerError {
  final String _message;

  DatasourceError(this._message);

  @override
  String get message => _message;
}
