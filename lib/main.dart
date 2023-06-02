import 'package:flutter/material.dart';
import 'package:order_app/app/home/home_page.dart';
import 'package:order_app/app/order/order_page.dart';
import 'package:order_app/app/order/orders.dart';
import 'package:order_app/utils/appRoutes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const InitialPage());
}

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Orders())],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        routes: {
          AppRoutes.HOME_PAGE: (context) => const HomePage(),
          AppRoutes.ORDER_PAGE: (context) => const OrderPage()
        },
        initialRoute: AppRoutes.HOME_PAGE,
      ),
    );
  }
}
