

import 'package:flutter/widgets.dart';

class ResponsiveText {
  static late double _scale;
  static void init(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    _scale = width / 375;
    _scale = _scale.clamp(0.85, 1.15);
  }

  static double font(double size) => _scale * size;
}
