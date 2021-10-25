class HomeException implements Exception{
  final String message;

  HomeException(this.message);

  @override
  String toString() => 'HomeException(message: $message)';
}