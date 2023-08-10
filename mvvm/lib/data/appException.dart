class appException implements Exception {
  final _message;
  final _prefix;
  appException([this._message, this._prefix]);
  String toString() {
    return '$_message$_prefix';
  }
}

class FetchException extends appException {
  FetchException([String? message])
      : super(message, 'Error during communication');
}

class BadRequestException extends appException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorizedException extends appException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized access');
}
