import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/feature/orders/ui/widgets/home_wrapper.dart';


import 'core/helper/responsive_text.dart';
import 'core/theme/app_ios_Theme.dart';
import 'core/theme/app_theme.dart';
import 'package:bloc/bloc.dart';

import 'feature/orders/data/repo/orders_repo.dart';
import 'feature/orders/data/services/order_api_services.dart';
import 'feature/orders/logic/orders_cubit.dart';
import 'feature/orders/ui/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OrderApiServices>(
          create: (_) => OrderApiServices(),
        ),
        RepositoryProvider<OrdersRepository>(
          create: (context) => OrdersRepository(
            apiService: context.read<OrderApiServices>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<OrdersCubit>(
            create: (context) => OrdersCubit(
              repository: context.read<OrdersRepository>(),
            )..loadHomeOrders(),
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Initialize responsive scaling ONCE
            ResponsiveText.init(context);

            if (Platform.isIOS) {
              return CupertinoApp(
                debugShowCheckedModeBanner: false,
                theme: AppCupertinoTheme.theme,
                home:  HomeWrapper(),
              );
            }

            // Android / others
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              home: const HomeWrapper(),
            );
          },
        ),
      ),
    );
  }
}
