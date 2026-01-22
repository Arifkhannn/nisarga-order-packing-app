import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/feature/orders/logic/orders_cubit.dart';
import 'package:nisarga_order_packing/feature/orders/ui/home_screen.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
 
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    
      WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<OrdersCubit>().loadHomeOrders();
  });
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      currentIndex: _currentIndex,
      onTabChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
