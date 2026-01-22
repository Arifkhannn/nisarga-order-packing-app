import 'package:nisarga_order_packing/core/helper/order_exception.dart';
import 'package:nisarga_order_packing/feature/orders/data/models/order_model.dart';
import 'package:nisarga_order_packing/feature/orders/data/services/order_api_services.dart';

class OrdersRepository {
  final OrderApiServices apiService;

  OrdersRepository({required this.apiService});

  Future<List<Orders>> getOrders() async {
    try {
      final json = await apiService.fetchAllOrder();
      final response = OrderResponse.fromJson(json);
      print(response);
      return response.data;
    } catch (e) {
      print('error of teh list of order repo$e');
      // log error if needed
      throw OrdersException(message: 'Failed to load orders', originalError: e);
    }
  }
}
