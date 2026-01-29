import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/feature/orders/data/services/order_api_services.dart';
import 'package:nisarga_order_packing/feature/packing/data/services/order_packed_api.dart';
import 'packing_state.dart';

class PackingCubit extends Cubit<PackingState> {
  final int orderId;
  final int totalItems;

  PackingCubit({required this.orderId, required this.totalItems})
    : super(PackingState.initial());

  /// toggle item packed / unpacked
  void toggleItem(String itemId) {
    final updated = Set<String>.from(state.packedItemIds);

    if (updated.contains(itemId)) {
      updated.remove(itemId);
    } else {
      updated.add(itemId);
    }

    emit(state.copyWith(packedItemIds: updated));
  }

  /// whether all items are packed
  bool get isAllPacked => state.packedItemIds.length == totalItems;

  /// submit packed order
  Future<void> markOrderPacked() async {
    print('MARK PACKED CLICKED');
    print('orderId = $orderId');
    print('totalItems = $totalItems');
    print('packedItems = ${state.packedItemIds.length}');

    final OrderPackedApi apiServices = OrderPackedApi();
    if (!isAllPacked) {
      print('NOT ALL ITEMS PACKED – RETURNING');
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    try {
      print('CALLING API NOW');
      await apiServices.markOrderPacked(orderId);
      print('API CALL SUCCESS');

      emit(state.copyWith(isSubmitting: false,packedSucess: true));
    } catch (e) {
      print('API ERROR: $e');
      emit(
        state.copyWith(
          isSubmitting: false,
          error: 'Failed to mark order packed',
        ),
      );
    }
  }
}
