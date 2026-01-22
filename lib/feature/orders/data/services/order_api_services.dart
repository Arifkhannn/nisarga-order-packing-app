import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:nisarga_order_packing/core/helper/api_exception.dart';
import 'package:nisarga_order_packing/core/helper/base_api_url.dart';
import 'package:http/http.dart' as http;

class OrderApiServices {
  final String token = "1|s1bfdKFr2O88OsGzxqvge2T9m29u9YSsBMiu5NcC4b822955";
  Future<Map<String, dynamic>> fetchAllOrder() async {
    final url = Uri.parse('$baseUrl/packer/orders');

    final response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print(
        '   ------- --- - - - -- something went wrong while fetching the orders api',
      );
      final errorBody = jsonDecode(response.body);
      print(errorBody);
      throw ApiException(
        message: errorBody['message'] ?? 'Something went wrong',
        statusCode: response.statusCode,
      );
    }
  }
}
