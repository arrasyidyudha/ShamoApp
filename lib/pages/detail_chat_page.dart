import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor1,
          centerTitle: false,
          title: Container(
            margin: EdgeInsets.only(
              top: 20,
              bottom: 5,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: primaryTextColor,
                  ),
                ),
                SizedBox(
                  width: defaultMargin,
                ),
                Image.asset(
                  'assets/img_store-online.png',
                  width: 40,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Paedi',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      'Online',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Widget productPreview() {
    //   return Container(
    //     width: 225,
    //     height: 74,
    //     margin: EdgeInsets.only(bottom: 20),
    //     padding: EdgeInsets.all(10),
    //     decoration: BoxDecoration(
    //       color: backgroundColor5,
    //       borderRadius: BorderRadius.circular(20),
    //       border: Border.all(
    //         color: thirdColor,
    //       ),
    //     ),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         ClipRRect(
    //           borderRadius: BorderRadius.circular(12),
    //           child: Image.asset(
    //             'assets/img_shoes5.png',
    //             width: 54,
    //           ),
    //         ),
    //         SizedBox(
    //           width: 10,
    //         ),
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Adidas Shoes N80',
    //                 style: primaryTextStyle,
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //               SizedBox(
    //                 height: 3,
    //               ),
    //               Text(
    //                 '\$40',
    //                 style: priceTextStyle.copyWith(
    //                   fontWeight: medium,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Image.asset(
    //           'assets/icon_close.png',
    //           width: 22,
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Hi, This item is still available?',
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            text: 'Yes sure, This item is available in size 42 and 43',
          ),
        ],
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type massage',
                          hintStyle: thirdTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/icon_send.png',
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
