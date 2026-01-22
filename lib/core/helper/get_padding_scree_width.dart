import 'package:flutter/material.dart';

double horizontalPadding(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width < 360) return 12;
  if (width < 600) return 16;
  if (width < 900) return 24;
  return 32;
}
