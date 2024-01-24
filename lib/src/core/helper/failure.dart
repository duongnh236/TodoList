import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int status;
  const Failure(this.status, this.message);

  @override
  List<Object> get props => [message];
}

class Exception extends Failure {
  const Exception(int status, String message) : super(status, message);
}

class LocalDatabaseQueryFailure extends Failure {
  const LocalDatabaseQueryFailure(String message) : super(999, message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(int status, String message)
      : super(status, message);
}

class ParsingFailure extends Failure {
  const ParsingFailure(String message) : super(998, message);
}
