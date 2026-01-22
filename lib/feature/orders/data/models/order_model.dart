import 'package:flutter/foundation.dart';

class OrderResponse {
  final bool status;
  final List<Orders> data;

  OrderResponse({required this.data, required this.status});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      data: (json['orders'] as List).map((e) => Orders.fromJson(e)).toList(),
      status: json['status'] ?? false,
    );
  }
}

class Orders {
  int? orderId;
  final String orderNumber;
  final String orderStatus;
  final String paymentMode;
  final String paymentStatus;
  final double totalAmount;

  final Customer customer;
  final List<OrderItem> items;
  String? time;

  Orders({
    this.orderId,
    required this.orderNumber,
    required this.orderStatus,
    required this.paymentMode,
    required this.paymentStatus,
    required this.totalAmount,

    required this.customer,
    required this.items,
    this.time
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      orderId: json['order_id'],
      orderNumber: json['order_number'],
      orderStatus: json['order_status'],
      paymentMode: json['payment_mode'],
      paymentStatus: json['payment_status'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      customer: Customer.fromJson(json['customer']),
      items: (json['items'] as List).map((e) => OrderItem.fromJson(e)).toList(),
      time: json['created_at']??'',
    );
  }
}

class Customer {
  final int? customerId; // nullable (guest orders)
  final String name;
  final String phone;
  final String email;
  final String address;

  Customer({
    this.customerId,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['customer_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
    );
  }
}

class OrderItem {
  final int productId;
  final String productName;
  final double price;
  final int quantity;

  final String? image;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    this.image,
  });
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['product_id'],
      productName: json['product_name'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],

      image:
          json['image'] ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZzKa_3FYC14X97EPiR_eLfmnyBYJ4sv1QKg&s',
    );
  }
}
