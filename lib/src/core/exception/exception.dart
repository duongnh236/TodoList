// No connection
class NoInternetConnectionException implements RestApiException {
   NoInternetConnectionException(this._message, this._status, this._typeEx);
  final String? _message;
  final int? _status;
  final String? _typeEx;
  @override
  String? get message => _message;
  
  @override
  int? get status => _status;
  
  @override
  String? get typeEx => _typeEx;
}

class TimeoutException implements RestApiException {
  TimeoutException(this._message, this._status, this._typeEx);
  final String? _message;
  final int? _status;
  final String? _typeEx;
  @override
  String? get message => _message;

  @override
  int? get status => _status;

  @override
  String? get typeEx => _typeEx;
  
}

class ReceiveTimeoutException implements RestApiException {
   ReceiveTimeoutException(this._message, this._status, this._typeEx);
  final String? _message;
  final int? _status;
  final String? _typeEx;
  @override
  String? get message => _message;
  
  @override
  int? get status => _status;
  
  @override
  String? get typeEx => _typeEx;
}


class BadResponseException implements RestApiException {
   BadResponseException(this._message, this._status, this._typeEx);
  final String? _message;
  final int? _status;
  final String? _typeEx;
  @override
  String? get message => _message;
  
  @override
  int? get status => _status;
  
  @override
  String? get typeEx => _typeEx;
}

// Unauthorized Exception
class UnauthorizedException implements RestApiException {
    UnauthorizedException(this._message, this._status, this._typeEx);
  final String? _message;
  final int? _status;
  final String? _typeEx;
  @override
  String? get message => _message;
  
  @override
  int? get status => _status;
  
  @override
  String? get typeEx => _typeEx;
}

// Internal Server Error Exception
class InternalServerErrorException implements RestApiException {
    InternalServerErrorException(this._message, this._status, this._typeEx);
  final String? _message;
  final int? _status;
  final String? _typeEx;
  @override
  String? get message => _message;
  
  @override
  int? get status => _status;
  
  @override
  String? get typeEx => _typeEx;
}

// End Point not found Exception
class NotFoundEndPointException implements RestApiException {
   NotFoundEndPointException(this._message, this._status, this._typeEx);
  final String? _message;
  final int? _status;
  final String? _typeEx;
  @override
  String? get message => _message;
  
  @override
  int? get status => _status;
  
  @override
  String? get typeEx => _typeEx;
}

// Bad Request Exception
class BadRequestException implements RestApiException {
   BadRequestException(this._message, this._status, this._typeEx);
  final String? _message;
  final int? _status;
  final String? _typeEx;
  @override
  String? get message => _message;
  
  @override
  int? get status => _status;
  
  @override
  String? get typeEx => _typeEx;
}

class RestApiException implements Exception {
  final int? status;
  final String? message;
  final String? typeEx;
  RestApiException({this.status, this.message, this.typeEx});
}