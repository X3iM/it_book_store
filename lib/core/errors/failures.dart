abstract class Failure {
  final String? errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required String? errorMessage}) : super(errorMessage: errorMessage);
}

class ParamsFailure extends Failure {
  ParamsFailure({required String? errorMessage}) : super(errorMessage: errorMessage);
}

class UnknownFailure extends Failure {
  UnknownFailure({required String? errorMessage}) : super(errorMessage: errorMessage);
}
