import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/feature/orders/logic/orders_cubit.dart';
import 'package:nisarga_order_packing/feature/orders/logic/orders_state.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/pending_orders_widgets/empty_state_msg.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/pending_orders_widgets/pending_order_card.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/pending_orders_widgets/search_bar_widget.dart';


class PendingPackingScreen extends StatelessWidget {
  const PendingPackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: AppColors.surface,
      //   title: Text(
      //     'Pending Orders',
      //     style: AppTextStyles.heading(context),
      //   ),
      // ),
      appBar: AppBar(
        toolbarHeight: 70, // Slightly taller for more "breathing room"
        elevation: 0,
        scrolledUnderElevation: 0, // Prevents ugly color change on scroll
        backgroundColor: AppColors.surface,
        centerTitle: false, // Left-aligned title is more modern
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pending Orders',
              style: AppTextStyles.heading(context).copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Manage and pack incoming orders',
              style: AppTextStyles.caption(context).copyWith(
                color: Colors.grey[500],
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          // 2. Added a subtle notification or profile action
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.background,
              child: Icon(
                Icons.notifications_none_rounded,
                color: AppColors.textPrimary,
                size: 20,
              ),
            ),
          ),
        ],
        // 3. Optional: Add a very subtle bottom border instead of shadow
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          /// 🔄 Loading
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          /// ❌ Error
          if (state.error != null) {
            return Center(
              child: Text(
                state.error!,
                style: AppTextStyles.body(context),
              ),
            );
          }

          return Column(
            children: [
              const SizedBox(height: 12),
              const OrderSearchBar(),
              const SizedBox(height: 8),

              /// 📦 Orders List
              Expanded(
                child: state.filteredPending.isEmpty
                    ? EmptyState(
                        message: state.searchQuery.isEmpty
                            ? 'No pending orders'
                            : 'No orders found',
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: state.filteredPending.length,
                        itemBuilder: (context, index) {
                          final order = state.filteredPending[index];

                          return OrderCard(
                            customerName: order.customer.name,
                            address: order.customer.address,
                            amount: order.totalAmount,
                            timeAgo: order.time??'',
                            paymentMode: order.paymentMode,
                            itemImages:
                                order.items.map((e) => e.image??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZzKa_3FYC14X97EPiR_eLfmnyBYJ4sv1QKg&s').toList(),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
