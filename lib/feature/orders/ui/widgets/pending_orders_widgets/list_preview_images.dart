import 'package:flutter/material.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';

class ItemPreviewRow extends StatelessWidget {
  final List<String> images;

  const ItemPreviewRow({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    // Show up to 4 images before the "+n" badge
    const int maxVisible = 4;
    final visibleImages = images.take(maxVisible).toList();
    final extraCount = images.length - visibleImages.length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 44, // Increased height for larger images
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < visibleImages.length; i++)
                Align(
                  // This creates the overlap effect
                  widthFactor: 0.6, 
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 28, // Increased size
                      backgroundColor: AppColors.background,
                      backgroundImage: NetworkImage(visibleImages[i]),
                    ),
                  ),
                ),
            ],
          ),
        ),
        
        // Show +n badge at the far right
        if (extraCount > 0) ...[
          const SizedBox(width: 8), // Padding after the overlap stack
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Text(
              '+$extraCount',
              style: AppTextStyles.caption(context).copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.info,
              ),
            ),
          ),
        ],
      ],
    );
  }
}