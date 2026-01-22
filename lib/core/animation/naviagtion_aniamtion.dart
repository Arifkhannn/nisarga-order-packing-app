import 'package:flutter/material.dart';

void animatedNavigate(
  BuildContext context,
  Widget nextScreen,
) {
  Navigator.of(context).push(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, animation, __) => nextScreen,
      transitionsBuilder: (_, animation, __, child) {
        final slide = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        );

        return SlideTransition(
          position: slide,
          child: child,
        );
      },
    ),
  );
}
