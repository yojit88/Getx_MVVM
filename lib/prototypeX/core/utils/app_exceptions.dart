class AppExceptions implements Exception {
  final String? message;
  final String? prefix;

  AppExceptions([this.prefix, this.message]);

  @override
  String toString() {
    return '$prefix ${message ?? ""}';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super('No InterNet', message);
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'TimeOut');
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'Internal Server Error');
}
