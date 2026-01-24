import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/feature/orders/data/models/order_model.dart';

import '../../logic/packing_cubit.dart';
import '../../logic/packing_state.dart';

class PackingItemTile extends StatelessWidget {
  final OrderItem item;

  const PackingItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final String itemKey = item.itemId.toString();

    return BlocBuilder<PackingCubit, PackingState>(
      buildWhen: (p, c) =>
          p.packedItemIds.contains(itemKey) !=
          c.packedItemIds.contains(itemKey),
      builder: (context, state) {
        final bool isChecked =
            state.packedItemIds.contains(itemKey);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  item.image ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZzKa_3FYC14X97EPiR_eLfmnyBYJ4sv1QKg&s',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${item.quantity}x ${item.productName}',
                  style: AppTextStyles.subHeading(context),
                ),
              ),
              Checkbox(
                value: isChecked,
                onChanged: (_) {
                  context.read<PackingCubit>().toggleItem(itemKey);
                },
                activeColor: AppColors.success,
                checkColor: Colors.white,
                side: BorderSide(
                  color: isChecked
                      ? AppColors.success
                      : AppColors.textSecondary,
                  width: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

