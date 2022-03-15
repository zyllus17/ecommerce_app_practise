import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/widgets/custom_navbar.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Zero to Unicorn'),
        bottomNavigationBar: const CustomNavBar(),
        body: Container(
            child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: false,
          ),
          items: Category.categories
              .map((category) => HeroCarouselCard(category: category))
              .toList(),
        )));
  }
}
