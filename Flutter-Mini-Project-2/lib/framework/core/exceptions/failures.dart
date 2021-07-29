import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([
    this.message = '',
  ]);

  final String message;

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure([message]) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure([message]) : super(message);
}

class AuthenticationFailure extends Failure {}

class CacheFailure extends Failure {}

class InvalidCredentialFailure extends Failure {}

class NotFoundFailure extends Failure {}

class BadRequestFailure extends Failure {
  BadRequestFailure([message]) : super(message);
}

class UnauthorisedFailure extends Failure {}

class FetchDataFailure extends Failure {}
