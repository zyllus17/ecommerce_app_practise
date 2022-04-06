import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PaymentSelection extends StatelessWidget {
  static const String routeName = '/payment-selection';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => PaymentSelection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Selection'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Text(
            'CHOOSE A PAYMENT OPTION',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          // RawApplePayButton(
          //   style: ApplePayButtonStyle.black,
          //   type: ApplePayButtonType.inStore,
          //   onPressed: () {},
          // ),
          SizedBox(height: 10),
          RawGooglePayButton(
            style: GooglePayButtonStyle.black,
            type: GooglePayButtonType.pay,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
