// import 'dart:io';import 'package:url_launcher/link.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';
import 'package:ag/products.dart';
import 'package:ag/cart_item.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
//import 'package:linkable/linkable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartItems = products.take(4).toList();

  var htpsUri = Uri.parse(
      'http://checkout.chapa.co/checkout/web/payment/SC-mJB5eFHyTNcu'); //print(httpsUri); // https://dart.dev/guides/libraries/library-tour#numbers
  @override
  Widget build(BuildContext context) {
    final total = cartItems
        .map((cartItem) => cartItem.price)
        .reduce((value, element) => value + element)
        .toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.info_outline,
            size: 22,
          ), //static const IconData book_circle_fill = IconData(0xf5a0, fontFamily: iconFont, fontPackage: iconFontPackage);
          onPressed: () {
            final completer = Completer<bool>();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 5),
                action: SnackBarAction(
                  label: "OK",
                  onPressed: () {
                    completer.complete(false);
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  },
                ),
                content: const Text(
                  "Did You Know You can swipe left to remove item from the cart List",
                ),
              ),
            );
          },
        ),
        title: const Text(
          'DID YOU KNOW ? You can swipe left to remove item from the cart List',
          style: TextStyle(
            fontSize: 14.0,
            color: Color.fromARGB(255, 178, 74, 238),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...List.generate(
              cartItems.length,
              (index) {
                final cartItem = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CartItem(cartItem: cartItem),
                );
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total (${cartItems.length} items)"),
                Text(
                  "\$$total",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  // Link(
                  //   uri: htpsUri,
                  //   target: LinkTarget.blank,
                  //   builder: (context, followLink) => ElevatedButton(
                  //     child: Text('Proceed to Checkout'),
                  //     onPressed: followLink,
                  //   ),
                  // );
                  launchUrl(htpsUri);
                },
                label: const Text(" Checkout (accept only chapa payment)"),
                icon: const Icon(IconlyBold.wallet, size: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showMyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: const Text("Swipe to Left to remove from cart"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.done),
        )
      ],
    ),
  );
}

