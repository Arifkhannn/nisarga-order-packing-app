import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _iosBottomNav();
    }
    return _androidBottomNav();
  }

  // -------- ANDROID --------
  Widget _androidBottomNav() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.textPrimary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded,color: AppColors.pending_packaging_icon,),
          label: 'Home'
          ,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_rounded,color: AppColors.packed_order_icon,),
          label: 'Packing',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping_rounded,color: AppColors.out_delivery_icon,),
          label: 'Delivery',
        ),
      ],
    );
  }

  // -------- iOS --------
  Widget _iosBottomNav() {
    return CupertinoTabBar(
      currentIndex: currentIndex,
      backgroundColor: AppColors.surface,
      activeColor: AppColors.primary,
      inactiveColor: AppColors.textSecondary,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cube_box),
          label: 'Packing',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.car_detailed),
          label: 'Delivery',
        ),
      ],
    );
  }
}
