import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/core/animation/naviagtion_aniamtion.dart';
import 'package:nisarga_order_packing/core/helper/get_padding_scree_width.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/feature/orders/logic/orders_cubit.dart';
import 'package:nisarga_order_packing/feature/orders/logic/orders_state.dart';
import 'package:nisarga_order_packing/feature/orders/ui/pending_packing_screen.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/bottom_navBar.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/order_status_detail/main_order_status.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/order_status_detail/order_status_detail.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/top_status_card.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/welcome_header.dart';

class HomeScreen extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;
  const HomeScreen({
    super.key,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    context.read<OrdersCubit>().loadHomeOrders();
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Asmara Packing'),
        ),
        child: SafeArea(child: _Body()),
      );
    }

    // Android
    return Scaffold(
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onTap: onTabChanged,
      ),
      backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   title: Text('', style: AppTextStyles.heading(context)),
      // ),
      // appBar: AppBar(
      //   toolbarHeight: 70,
      //   backgroundColor: AppColors.background,
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'Asmara Packing',
      //         style: AppTextStyles.heading(context).copyWith(
      //           fontWeight: FontWeight.w900,
      //           letterSpacing: -0.8,
      //         ),
      //       ),
      //       Text(
      //         'Workspace Dashboard',
      //         style: AppTextStyles.caption(context).copyWith(color: Colors.grey),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const CircleAvatar(
      //         radius: 18,
      //         backgroundColor: Colors.white,
      //         child: Icon(Icons.person_outline, size: 20, color: Colors.black),
      //       ),
      //     ),
      //     const SizedBox(width: 8),
      //   ],
      // ),
      appBar: PreferredSize(
  preferredSize: const Size.fromHeight(86),
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.background,
          AppColors.background.withOpacity(0.95),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border(
        bottom: BorderSide(
          color: Colors.black.withOpacity(0.05),
          width: 1,
        ),
      ),
    ),
    child: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // LEFT — TITLE
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nisarga Packing',
                    style: AppTextStyles.heading(context).copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.warehouse_outlined,
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Workspace Dashboard',
                        style: AppTextStyles.caption(context).copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // RIGHT — ACTIONS
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    size: 26,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
),

      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(horizontalPadding(context)),
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state.isLoading && state.pending.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const WelcomeHeader(),
                SizedBox(height: size.height * 0.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OrderStatusCard(
                        
                        title: 'Pending ',
                        orderCount: state.pending.length,
                        badgeCount: state.pending.length,
                        secondaryCount: state.pending.length,
                        mainIcon: Icons.hourglass_empty,
                        secondaryIcon: Icons.inventory_2_outlined,
                        backgroundColor: AppColors.pending_packaging,
                        iconColor: AppColors.pending_packaging_icon,
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Expanded(
                      child: OrderStatusCard(
                        title: 'Packed',
                        orderCount: state.packed.length,
                        badgeCount: state.packed.length,
                        secondaryCount: state.packed.length,
                        mainIcon: Icons.check,
                        secondaryIcon: Icons.inventory_2_outlined,
                        backgroundColor: AppColors.packed_order,
                        iconColor: AppColors.packed_order_icon,
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Expanded(
                      child: OrderStatusCard(
                        title: 'Delivery',
                        orderCount: state.outForDelivery.length,
                        badgeCount: state.outForDelivery.length,
                        secondaryCount: state.outForDelivery.length,
                        mainIcon: Icons.delivery_dining,
                        secondaryIcon: Icons.inventory_2_outlined,
                        backgroundColor: AppColors.out_delivery,
                        iconColor: AppColors.out_delivery_icon,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      OrderSectionHeader(
                        iconColor: AppColors.pending_packaging_icon,
                        icon: Icons.hourglass_empty,
                        title: 'Pending Packing',
                        onViewAll: () {
                          
                          animatedNavigate(context, PendingPackingScreen());
                      
                        },
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.pending.length > 2
                            ? 2
                            : state.pending.length,
                        itemBuilder: (context, index) {
                          final order = state.pending[index];
                          return PendingOrderCard(
                            buttonColor: AppColors.pending_packaging_icon,
                            orderId: order.orderId ?? 0,
                            customerName: order.customer.name,
                            location: order.customer.address,
                            paymentMode: order.paymentMode,
                            amount: order.totalAmount,
                            onStartPacking: () {},
                          );
                        },
                      ),
                    ],
                  ),
                ),
                //packed order----------
                SizedBox(height: size.height * 0.02),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.packed_order,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      OrderSectionHeader(
                        iconColor: AppColors.packed_order,
                        icon: Icons.check,
                        title: 'Packed',
                        onViewAll: () {},
                      ),
                      const SizedBox(height: 12),

                      // 👇 EMPTY STATE HANDLING
                      if (state.packed.isEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              'No Data Available',
                              style: AppTextStyles.body(context),
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.packed.length > 2
                              ? 2
                              : state.packed.length,
                          itemBuilder: (context, index) {
                            final order = state.packed[index];
                            return PendingOrderCard(
                              buttonColor: AppColors.packed_order_icon,
                              orderId: order.orderId ?? 0,
                              customerName: order.customer.name,
                              location: order.customer.address,
                              paymentMode: order.paymentMode,
                              amount: order.totalAmount,
                              onStartPacking: () {},
                            );
                          },
                        ),
                    ],
                  ),
                ),
                //delivery---
                SizedBox(height: size.height * 0.02),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.out_delivery,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      OrderSectionHeader(
                        iconColor: AppColors.out_delivery_icon,
                        icon: Icons.delivery_dining,
                        title: 'Delivery',
                        onViewAll: () {},
                      ),
                      const SizedBox(height: 12),

                      // 👇 EMPTY STATE HANDLING
                      if (state.outForDelivery.isEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              'No Data Available',
                              style: AppTextStyles.body(context),
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.outForDelivery.length > 2
                              ? 2
                              : state.packed.length,
                          itemBuilder: (context, index) {
                            final order = state.outForDelivery[index];
                            return PendingOrderCard(
                              buttonColor: AppColors.out_delivery_icon,
                              orderId: order.orderId ?? 0,
                              customerName: order.customer.name,
                              location: order.customer.address,
                              paymentMode: order.paymentMode,
                              amount: order.totalAmount,
                              onStartPacking: () {},
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
