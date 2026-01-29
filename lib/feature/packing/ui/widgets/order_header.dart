import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';


class OrderHeader extends StatelessWidget {
  final String customerName;
  final String address;
  final double amount;
  final String paymentMode;
  final VoidCallback? onMarkPacked;
  final bool isMarkPackedEnabled;
  final  VoidCallback? sendWhatsapp;

  const OrderHeader({
    super.key,
    required this.customerName,
    required this.address,
    required this.amount,
    required this.paymentMode,
    this.onMarkPacked,
    this.isMarkPackedEnabled = false,
    this.sendWhatsapp
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Avatar
            const CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.info,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),

            /// Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customerName,
                    style: AppTextStyles.subHeading(context),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    address,
                    style: AppTextStyles.body(context),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      paymentMode,
                      style: AppTextStyles.caption(context),
                    ),
                  ),
                ],
              ),
            ),

            /// Right Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '€ ${amount.toStringAsFixed(2)}',
                  style: AppTextStyles.subHeading(context),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 36,
                  // child: ElevatedButton(
                  //   onPressed:
                  //       isMarkPackedEnabled ? onMarkPacked : null,
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: isMarkPackedEnabled
                  //         ? AppColors.warning
                  //         : Colors.grey.shade300,
                  //     elevation: 0,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(22),
                  //     ),
                  //   ),
                  //   child: const Text(
                  //     'Mark Packed',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  child: IconButton(onPressed: sendWhatsapp, icon: FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
