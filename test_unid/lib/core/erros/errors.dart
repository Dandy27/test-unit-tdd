abstract class PostExeception implements Exception {
  final String message;
  final StackTrace? stacktrace;

  PostExeception(this.message, [this.stacktrace]);
}

class InvalidPostParams extends PostExeception {
  InvalidPostParams(String message) : super(message);
}

class PostRepositoryException extends PostExeception {
  PostRepositoryException(String message,[ StackTrace? e]) : super(message, e);
}


//objeto de erro