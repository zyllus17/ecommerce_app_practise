import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  // final bool additionalButtons;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.25,
    this.leftPosition = 5,
    this.isWishlist = false,
    // this.additionalButtons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: product,
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: 80,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 15 - leftPosition,
              height: 70,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          '\$${product.price}',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is CartLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is CartLoaded) {
                              return IconButton(
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // final snackBar = SnackBar(
                                  //   content: Text('Added to your Cart!'),
                                  // );
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(snackBar);

                                  context.read<CartBloc>().add(
                                        CartProductAdded(product),
                                      );
                                },
                              );
                            } else {
                              return Text('Something went wrong');
                            }
                          },
                        ),
                        isWishlist
                            ? IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              )
                            : SizedBox(),
                        // additionalButtons
                        //     ? IconButton(
                        //         padding: EdgeInsets.zero,
                        //         icon: Icon(
                        //           Icons.delete,
                        //           color: Colors.white,
                        //         ),
                        //         onPressed: () {
                        //           final snackBar = SnackBar(
                        //             content:
                        //                 Text('Removed from your Wishlist!'),
                        //           );
                        //           ScaffoldMessenger.of(context)
                        //               .showSnackBar(snackBar);
                        //           context
                        //               .read<WishlistBloc>()
                        //               .add(WishlistProductRemoved(product));
                        //         },
                        //       )
                        //     : SizedBox()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
