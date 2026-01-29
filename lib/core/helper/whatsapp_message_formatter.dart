

import 'package:nisarga_order_packing/feature/orders/data/models/order_model.dart';

String buildPackedOrderMessage(Orders order) {
  final buffer = StringBuffer();

  buffer.writeln('Hi 👋');
  buffer.writeln('This is Nisarga Fresh 🌿');
  buffer.writeln('');
  buffer.writeln('Your order has been packed successfully ✅');
  buffer.writeln('');
  buffer.writeln('🧺 Order Summary:');

  for (final item in order.items) {
    buffer.writeln('• ${item.productName} × ${item.quantity}');
  }

  buffer.writeln('');
  buffer.writeln('Total Items: ${order.items.length}');
  buffer.writeln('');
  buffer.writeln('Thank you for shopping with us 🙏');

  return buffer.toString();
}
