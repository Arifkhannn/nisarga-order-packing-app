import 'package:flutter/material.dart';
import 'package:nisarga_order_packing/core/helper/get_padding_scree_width.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/core/theme/app_color.dart';

class OrderStatusCard extends StatelessWidget {
  final String title;
  final int orderCount;
  final int badgeCount;
  final int secondaryCount;
  final IconData mainIcon;
  final IconData secondaryIcon;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final Color iconColor;

  const OrderStatusCard({
    super.key,
    required this.title,
    required this.orderCount,
    required this.badgeCount,
    required this.secondaryCount,
    required this.mainIcon,
    required this.secondaryIcon,
    required this.backgroundColor,
    this.onTap,
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(horizontalPadding(context)),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ─── Top Row ───
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _IconBox(icon: mainIcon,iconColor: iconColor,),
                _Badge(count: badgeCount),
              ],
            ),

            const SizedBox(height: 14),

            /// ─── Title ───
            Text(title, style: AppTextStyles.subHeading(context)),

            const SizedBox(height: 1),

            /// ─── Bottom Row ───
            Row(
              children: [
                Text(
                  '$orderCount Orders',
                  style: AppTextStyles.caption(context),
                ),
                const Spacer(),
                Icon(secondaryIcon, size: 18, color: AppColors.textPrimary),
                const SizedBox(width: 4),
                Text(
                  secondaryCount.toString(),
                  style: AppTextStyles.body(
                    context,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _IconBox extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const _IconBox({required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 26, color: iconColor, shadows: [
    Shadow(
      blurRadius: 0,
      color: iconColor,
      offset: Offset(0.8, 0.8),
    ),
  ],),
    );
  }
}

class _Badge extends StatelessWidget {
  final int count;

  const _Badge({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        count.toString(),
        style: AppTextStyles.body(
          context,
        ).copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
      ),
    );
  }
}
