import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/feature/orders/data/models/order_model.dart';
import 'package:nisarga_order_packing/feature/packing/data/services/order_packed_api.dart';
import 'package:nisarga_order_packing/feature/packing/ui/widgets/marked_packed_button.dart';
import 'package:nisarga_order_packing/feature/packing/ui/widgets/order_header.dart';
import 'package:nisarga_order_packing/feature/packing/ui/widgets/packing_item_titel_card.dart';

import '../logic/packing_cubit.dart';
import '../logic/packing_state.dart';

class PackingOrderScreen extends StatelessWidget {
  final int orderId;
  final String customerName;
  final String address;
  final double amount;
  final String paymentMode;
  final List<OrderItem> items;

  const PackingOrderScreen({
    super.key,
    required this.orderId,
    required this.customerName,
    required this.address,
    required this.amount,
    required this.paymentMode,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final OrderPackedApi api;
    return BlocProvider(
      create: (_) => PackingCubit(orderId: orderId, totalItems: items.length),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.background,
          leading: const BackButton(color: Colors.black),
          title: Text('Packing Order', style: AppTextStyles.heading(context)),
        ),
        body: Column(
          children: [
            BlocBuilder<PackingCubit, PackingState>(
              builder: (context, state) {
                final cubit = context.read<PackingCubit>();

                return OrderHeader(
                  customerName: customerName,
                  address: address,
                  amount: amount,
                  paymentMode: paymentMode,
                  isMarkPackedEnabled: cubit.isAllPacked && !state.isSubmitting,
                  onMarkPacked: cubit.markOrderPacked,
                );
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return PackingItemTile(item: item);
                },
              ),
            ),
            const MarkPackedButton(),
          ],
        ),
      ),
    );
  }
}
