import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.cart.freeDeliveryString,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: const RoundedRectangleBorder(),
                            elevation: 0,
                          ),
                          child: Text(
                            'Add More Items',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartProductCard(
                              product: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                              quantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),
                            );
                          }),
                    ),
                    const OrderSummary(),
                  ],
                ),
              ),
            );
          }
          return const Text('Something went wrong');
        },
      ),
    );
  }
}
