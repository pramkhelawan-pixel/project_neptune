class NotAuthenticatedException implements Exception {
  final String message;

  const NotAuthenticatedException(this.message);

  @override
  String toString() => message;
}
