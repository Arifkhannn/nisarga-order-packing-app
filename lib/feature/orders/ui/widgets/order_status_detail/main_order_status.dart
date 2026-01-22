import 'package:flutter/material.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/core/theme/app_color.dart';

import 'payment_mode_chip.dart';

class PendingOrderCard extends StatelessWidget {
  final int orderId;
  final String customerName;
  final String location;
  final String paymentMode;
  final double amount;
  final VoidCallback onStartPacking;
  final Color buttonColor;

  const PendingOrderCard({
    super.key,
    required this.orderId,
    required this.customerName,
    required this.location,
    required this.paymentMode,
    required this.amount,
    required this.onStartPacking,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8), // ⬇ was 12
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8, // ⬇ was 14
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT
              children: [
                Text(
                  '$orderId  $customerName',
                  style: AppTextStyles.body(context),
                ),
                const SizedBox(height: 2), // ⬇ was 4
                Text(
                  location,
                  style: AppTextStyles.caption(context),
                ),
                const SizedBox(height: 6), // ⬇ was 8
                PaymentModeChip(label: paymentMode),
              ],
            ),
          ),

          /// RIGHT ACTION
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT
            children: [
              Text(
                '€ ${amount.toStringAsFixed(2)}',
                style: AppTextStyles.subHeading(context),
              ),
              const SizedBox(height: 6), // ⬇ was 10
              ElevatedButton(
                onPressed: onStartPacking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: AppColors.textPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12, // ⬇ was 14
                    vertical: 6, // ⬇ was 8
                  ),
                  minimumSize: Size.zero, // 🔥 prevents extra height
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  elevation: 0,
                ),
                child:  Text('Start Packing',style: AppTextStyles.subHeading(context).copyWith(fontSize: 12),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

