import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/core/helper/whatsapp_message_formatter.dart';
import 'package:nisarga_order_packing/core/helper/whatsapp_status_sender.dart';
import 'package:nisarga_order_packing/feature/packing/ui/widgets/marked_packed_button.dart';
import 'package:nisarga_order_packing/feature/packing/ui/widgets/order_header.dart';
import 'package:nisarga_order_packing/feature/packing/ui/widgets/packing_item_titel_card.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../core/theme/app_Color.dart';
import '../../../core/theme/app_Text_Style.dart';
import '../../orders/logic/orders_cubit.dart';
import '../logic/packing_cubit.dart';
import '../logic/packing_state.dart';

import '../../orders/data/models/order_model.dart';

class PackingOrderScreen extends StatelessWidget {
  final Orders order;

  const PackingOrderScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    // order whats app formater function here ----
    final String details = buildPackedOrderMessage(order);
    return BlocListener<PackingCubit, PackingState>(
      listenWhen: (prev, curr) =>
          prev.packedSucess != curr.packedSucess && curr.packedSucess,
      listener: (context, state) async {
        // 1️⃣ Show success alert
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: 'Packed Successfully',
          text: 'Order has been marked as packed.',
          showConfirmBtn: false,

          autoCloseDuration: Duration(seconds: 2),
        );

        // 2️⃣ Reload pending orders
        context.read<OrdersCubit>().loadHomeOrders();

        // 3️⃣ Navigate back AFTER alert closes
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.surface,
          title: Text('Packing Order', style: AppTextStyles.heading(context)),
        ),
        body: Column(
          children: [
            OrderHeader(
              customerName: order.customer.name,
              address: order.customer.address,
              amount: order.totalAmount,
              paymentMode: order.paymentStatus,
              sendWhatsapp: () {
                openWhatsApp(order.customer.phone, details);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  return PackingItemTile(item: order.items[index]);
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
