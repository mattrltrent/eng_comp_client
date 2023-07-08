abstract class Result {}

//! General results

class Empty extends Result {}

class Failure extends Result {
  final String? message;

  Failure({this.message});
}

class Success extends Result {}
