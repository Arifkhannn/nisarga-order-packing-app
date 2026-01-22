import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/feature/orders/data/models/order_model.dart';
import 'package:nisarga_order_packing/feature/orders/data/repo/orders_repo.dart';
import 'package:nisarga_order_packing/feature/orders/logic/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository repository;

  OrdersCubit({required this.repository}) : super(OrdersState.initial());

  Future<void> loadHomeOrders() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final orders = await repository.getOrders();

      final pending =
          orders.where((o) => o.orderStatus == 'pending').toList();
      final packed =
          orders.where((o) => o.orderStatus == 'packed').toList();
      final outForDelivery =
          orders.where((o) => o.orderStatus == 'out_for_delivery').toList();

      emit(
        state.copyWith(
          isLoading: false,
          pending: pending,
          packed: packed,
          outForDelivery: outForDelivery,

          // ✅ IMPORTANT
          filteredPending: pending,
          filteredPacked: packed,
          filteredOutForDelivery: outForDelivery,

          searchQuery: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to load orders',
        ),
      );
    }
  }

  void searchOrders(String query) {
    final lowerQuery = query.toLowerCase();

    List<Orders> filter(List<Orders> list) {
      return list.where((order) {
        return order.customer.name
                .toLowerCase()
                .contains(lowerQuery) ||
            order.orderId.toString().contains(lowerQuery);
      }).toList();
    }

    emit(
      state.copyWith(
        searchQuery: query,
        filteredPending: filter(state.pending),
        filteredPacked: filter(state.packed),
        filteredOutForDelivery: filter(state.outForDelivery),
      ),
    );
  }
}
