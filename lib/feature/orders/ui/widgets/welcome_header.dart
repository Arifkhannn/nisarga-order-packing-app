import 'package:flutter/material.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          'Welcome back!',
          style:  AppTextStyles.heading(context),
          
        ),
        SizedBox(height: 6),
        Text(
          "Here’s the latest update on your orders.",
          style: AppTextStyles.subHeading(context)
        ),
      ],
    );
  }
}
