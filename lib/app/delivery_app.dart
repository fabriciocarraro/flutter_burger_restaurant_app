import 'package:flutter/material.dart';
import 'package:flutter_burger_restaurant_app/app/core/provider/application_binding.dart';
import 'package:flutter_burger_restaurant_app/app/core/ui/theme/theme_config.dart';
import 'package:flutter_burger_restaurant_app/app/pages/auth/login/login_page.dart';
import 'package:flutter_burger_restaurant_app/app/pages/auth/login/login_router.dart';
import 'package:flutter_burger_restaurant_app/app/pages/auth/register/register_page.dart';
import 'package:flutter_burger_restaurant_app/app/pages/auth/register/register_router.dart';
import 'package:flutter_burger_restaurant_app/app/pages/home/home_router.dart';
import 'package:flutter_burger_restaurant_app/app/pages/order/order_page.dart';
import 'package:flutter_burger_restaurant_app/app/pages/order/order_router.dart';
import 'package:flutter_burger_restaurant_app/app/pages/product_detail/product_detail_router.dart';
import 'package:flutter_burger_restaurant_app/app/pages/splash/splash_page.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: "Delivery App",
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
        },
      ),
    );
  }
}
