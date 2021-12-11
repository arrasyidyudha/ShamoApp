import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class PaymentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //item payment
    Widget paymentItem(
      String text,
      item,
    ) {
      return Container(
        margin: EdgeInsets.only(
          top: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: lightTextStyle,
            ),
            Text(
              item,
              style: primaryTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      );
    }

    return Container(
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
          paymentItem(
            'Product Quantity',
            '2 Items',
          ),
          paymentItem(
            'Product Price',
            '\$80',
          ),
          paymentItem(
            'Shipping',
            'Free',
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
                '\$80',
                style: priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
