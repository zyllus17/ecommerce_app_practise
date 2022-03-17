import 'package:ecommerce_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart/cart_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp(
        title: 'Zero to unicorn',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
