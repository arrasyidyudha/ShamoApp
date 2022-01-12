import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';

import 'package:shamo/theme.dart';
import 'package:shamo/widgets/address_card.dart';
import 'package:shamo/widgets/checkout_card.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Details',
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          //List Item
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),

                //Item
                Column(
                    children: cartProvider.carts
                        .map(
                          (cart) => CheckoutCard(cart),
                        )
                        .toList()),

                //Address details
                AddressCard(),

                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Quantity',
                            style: lightTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            '${cartProvider.totalItems()} Items',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Price',
                            style: lightTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            '\$${cartProvider.totalPrice()}',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: lightTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            'Free',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: Divider(
                          thickness: 0.3,
                          color: thirdColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: priceTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            '\$${cartProvider.totalPrice()}',
                            style: priceTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //Payment

                SizedBox(
                  height: defaultMargin,
                ),
                Divider(
                  thickness: 0.3,
                  color: thirdColor,
                ),
                Container(
                  height: 54,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: defaultMargin,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        )),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/checkout-success', (route) => false);
                    },
                    child: Text(
                      'Checkout Now',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
