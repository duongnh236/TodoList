import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int status;
  final String typeEx;
  const Failure(this.status, this.message, this.typeEx);

  @override
  List<Object> get props => [message];
}

// class Exception extends Failure {
//   const Exception(int status, String message) : super(status, message);
// }

class LocalDatabaseQueryFailure extends Failure {
  const  LocalDatabaseQueryFailure(super.status, super.message, super.typeEx);
}

class ConnectionFailure extends Failure {
  const  ConnectionFailure(super.status, super.message, super.typeEx);
}

class ParsingFailure extends Failure {
  const  ParsingFailure(super.status, super.message, super.typeEx);
}
