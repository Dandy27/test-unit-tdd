abstract class PostExeception implements Exception {
  final String message;
  final StackTrace? stacktrace;

  PostExeception(this.message, [this.stacktrace]);
}



class InvalidPostParams extends PostExeception{
  InvalidPostParams(String message) : super(message);
}


//objeto de erro