import 'package:ecommerce_app/model/cart_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text(
                  'GO TO CHECKOUT',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '\$${Cart().freeDeliveryString}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(),
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
              SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: Cart.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartProductCard(product: Cart.products[index]);
                    }),
              ),
            ]),
            Column(
              children: [
                Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SUBTOTAL',
                              style: Theme.of(context).textTheme.headline5),
                          Text('\$${Cart().subtotalString}',
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('DELIVERY FEE',
                              style: Theme.of(context).textTheme.headline5),
                          Text('\$${Cart().deliveryFeeString}',
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      // alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'TOTAL',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${Cart().totalString}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      // body:
      //       Padding(
      //         padding:
      //             const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      //         child: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   state.cart.freeDeliveryString,
      //                   style: Theme.of(context).textTheme.headline5,
      //                 ),
      //                 ElevatedButton(
      //                   onPressed: () {
      //                     Navigator.pushNamed(context, '/');
      //                   },
      //                   style: ElevatedButton.styleFrom(
      //                     primary: Colors.black,
      //                     shape: RoundedRectangleBorder(),
      //                     elevation: 0,
      //                   ),
      //                   child: Text(
      //                     'Add More Items',
      //                     style: Theme.of(context)
      //                         .textTheme
      //                         .headline5!
      //                         .copyWith(color: Colors.white),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height: 20),
      //             SizedBox(
      //               height: 400,
      //               child: ListView.builder(
      //                   itemCount: state.cart
      //                       .productQuantity(state.cart.products)
      //                       .keys
      //                       .length,
      //                   itemBuilder: (BuildContext context, int index) {
      //                     return CartProductCard(
      //                       product: state.cart
      //                           .productQuantity(state.cart.products)
      //                           .keys
      //                           .elementAt(index),
      //                       quantity: state.cart
      //                           .productQuantity(state.cart.products)
      //                           .values
      //                           .elementAt(index),
      //                     );
      //                   }),
      //             ),
      //             OrderSummary(),
      //           ],
      //         ),
      //       );
      //     }
      //     return Text('Something went wrong');
      //   },
      // ),
    );
  }
}
