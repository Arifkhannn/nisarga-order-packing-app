import 'package:nisarga_order_packing/feature/orders/data/models/order_model.dart';

class OrdersState {
  final bool isLoading;
  final String? error;

  // original data
  final List<Orders> pending;
  final List<Orders> packed;
  final List<Orders> outForDelivery;

  // filtered data (used by UI)
  final List<Orders> filteredPending;
  final List<Orders> filteredPacked;
  final List<Orders> filteredOutForDelivery;

  final String searchQuery;

  OrdersState({
    required this.isLoading,
    required this.pending,
    required this.packed,
    required this.outForDelivery,
    required this.filteredPending,
    required this.filteredPacked,
    required this.filteredOutForDelivery,
    required this.searchQuery,
    this.error,
  });

  factory OrdersState.initial() {
    return OrdersState(
      isLoading: false,
      pending: [],
      packed: [],
      outForDelivery: [],
      filteredPending: [],
      filteredPacked: [],
      filteredOutForDelivery: [],
      searchQuery: '',
    );
  }

  OrdersState copyWith({
    bool? isLoading,
    String? error,
    List<Orders>? pending,
    List<Orders>? packed,
    List<Orders>? outForDelivery,
    List<Orders>? filteredPending,
    List<Orders>? filteredPacked,
    List<Orders>? filteredOutForDelivery,
    String? searchQuery,
  }) {
    return OrdersState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      pending: pending ?? this.pending,
      packed: packed ?? this.packed,
      outForDelivery: outForDelivery ?? this.outForDelivery,
      filteredPending: filteredPending ?? this.filteredPending,
      filteredPacked: filteredPacked ?? this.filteredPacked,
      filteredOutForDelivery:
          filteredOutForDelivery ?? this.filteredOutForDelivery,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
