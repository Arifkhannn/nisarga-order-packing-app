import 'package:http/http.dart' as http;
import 'package:nisarga_order_packing/core/helper/base_api_url.dart';

class OrderPackedApi {
  final String token =
      "1|s1bfdKFr2O88OsGzxqvge2T9m29u9YSsBMiu5NcC4b822955";

  Future<void> markOrderPacked(int orderId) async {
    final url = Uri.parse('https://nisarga.dftech.in/api/packer/mark-packed');

    final response = await http.post(
      url,
     headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
      body: {
        'order_id': orderId.toString() // ✅ REQUIRED
      },
    );

    print(
      'order packed response → ${response.statusCode} | ${response.body}',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to mark order packed');
    }
  }
}


