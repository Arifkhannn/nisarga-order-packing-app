import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/feature/orders/logic/orders_cubit.dart';
import 'package:nisarga_order_packing/feature/orders/logic/orders_state.dart';


class OrderSearchBar extends StatelessWidget {
  const OrderSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppColors.textSecondary),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  context.read<OrdersCubit>().searchOrders(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search by name or order id',
                  hintStyle: AppTextStyles.body(context),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            BlocBuilder<OrdersCubit, OrdersState>(
              buildWhen: (prev, curr) =>
                  prev.searchQuery != curr.searchQuery,
              builder: (context, state) {
                if (state.searchQuery.isEmpty) {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  onTap: () {
                    context.read<OrdersCubit>().searchOrders('');
                    FocusScope.of(context).unfocus();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
