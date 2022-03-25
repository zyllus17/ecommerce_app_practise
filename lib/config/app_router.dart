import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/screen/cart/cart_screen.dart';
import 'package:ecommerce_app/screen/screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(
          product: settings.arguments as Product,
        );
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(
          category: settings.arguments as Category,
        );
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
