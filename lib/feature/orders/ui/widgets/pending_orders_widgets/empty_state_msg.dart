import 'package:flutter/material.dart';
import 'package:nisarga_order_packing/core/theme/app_Text_Style.dart';

class EmptyState extends StatelessWidget {
  final String message;

  const EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyles.body(context),
      ),
    );
  }
}
