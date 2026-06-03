sealed class Failure {
  const Failure();

  String get message;

  @override
  String toString() => message;
}

class InternetFailure extends Failure {
  const InternetFailure();

  @override
  String get message => "No internet connection";
}

class ServerFailure extends Failure {
  const ServerFailure([this.customMessage]);

  final String? customMessage;

  @override
  String get message => customMessage ?? "Server error occurred";
}

class TimeoutFailure extends Failure {
  const TimeoutFailure();

  @override
  String get message => "Request timeout. Please try again";
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure();

  @override
  String get message => "You are not authorized. Please login again";
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure();

  @override
  String get message => "You do not have permission";
}

class NotFoundFailure extends Failure {
  const NotFoundFailure();

  @override
  String get message => "Requested data was not found";
}

class BadRequestFailure extends Failure {
  const BadRequestFailure([this.customMessage]);

  final String? customMessage;

  @override
  String get message => customMessage ?? "Invalid request";
}

class SomethingWentWrongFailure extends Failure {
  const SomethingWentWrongFailure();

  @override
  String get message => "Something went wrong";
}


