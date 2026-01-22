import 'package:flutter/material.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/pending_orders_widgets/list_preview_images.dart';

class OrderCard extends StatelessWidget {
  final String customerName;
  final String address;
  final double amount;
  final String timeAgo;
  final String paymentMode;
  final List<String> itemImages;

  const OrderCard({
    super.key,
    required this.customerName,
    required this.address,
    required this.amount,
    required this.timeAgo,
    required this.paymentMode,
    required this.itemImages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        // Subtle border instead of heavy shadow for a modern "flat" look
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// TOP SECTION: Name and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    customerName,
                    style: AppTextStyles.subHeading(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '€${amount.toStringAsFixed(2)}',
                  style: AppTextStyles.subHeading(context).copyWith(
                    color: AppColors.info, // Or your primary brand color
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            /// MIDDLE SECTION: Address and Time
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    address,
                    style: AppTextStyles.body(context).copyWith(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  timeAgo,
                  style: AppTextStyles.caption(context).copyWith(fontSize: 12),
                ),
              ],
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(height: 1, thickness: 0.5),
            ),

            /// BOTTOM SECTION: Previews and Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Item Preview Icons
                Expanded(
                  child: ItemPreviewRow(images: itemImages),
                ),
                
                // Action Button
                const SizedBox(width: 12),
                SizedBox(
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.warning.withOpacity(0.9),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Start Packing',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}