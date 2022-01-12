import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';

import 'package:shamo/theme.dart';
import 'package:shamo/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Your Cart',
        ),
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img_cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 154,
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home'); 
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: cartProvider.carts
            .map(
              (cart) => CartCard(cart),
            )
            .toList(),
      );
    }

    Widget customBottomNav() {
      return Container(
        // width: double.infinity,
        height: 185,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$${cartProvider.totalPrice()}',
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.3,
              color: thirdColor,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Countinue to Checkout',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: primaryTextColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: header(),
      body: cartProvider.carts.length == 0 ? emptyCart() : content(),
      bottomNavigationBar:
          cartProvider.carts.length == 0 ? SizedBox() : customBottomNav(),
    );
  }
}
