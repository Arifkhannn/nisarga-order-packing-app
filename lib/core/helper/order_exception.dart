class OrdersException implements Exception {
  final String message;
  final Object? originalError;

  OrdersException({
    required this.message,
    this.originalError,
  });

  @override
  String toString() => message;
}
