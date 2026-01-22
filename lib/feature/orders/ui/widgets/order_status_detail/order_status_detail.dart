import 'package:flutter/material.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/core/theme/app_color.dart';

class OrderSectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onViewAll;
  final Color iconColor;

  const OrderSectionHeader({
    super.key,
    required this.icon,
    required this.title,
    this.onViewAll,
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 8),
        Text(title, style: AppTextStyles.subHeading(context)),
        const Spacer(),
        InkWell(
          onTap: onViewAll,
          child: Row(
            children: [
              Text(
                'View All',
                style: AppTextStyles.body(
                  context,
                ).copyWith(color: AppColors.info, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.info,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
