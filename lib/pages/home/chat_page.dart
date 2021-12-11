import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_tile.dart';
import 'package:shamo/widgets/chat_tile2.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Massage Support',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    // Widget emptyChat() {
    //   return Expanded(
    //     child: Container(
    //       width: double.infinity,
    //       color: backgroundColor3,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image.asset(
    //             'assets/img_headset.png',
    //             width: 80,
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Text(
    //             'Oops, There is no massage',
    //             style: primaryTextStyle.copyWith(
    //               fontSize: 16,
    //               fontWeight: medium,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 12,
    //           ),
    //           Text(
    //             'You have never done a transaction?',
    //             style: secondaryTextStyle,
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Container(
    //             height: 44,
    //             child: TextButton(
    //               onPressed: () {},
    //               style: TextButton.styleFrom(
    //                 padding: EdgeInsets.symmetric(
    //                   horizontal: 24,
    //                   vertical: 10,
    //                 ),
    //                 backgroundColor: primaryColor,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(12),
    //                 ),
    //               ),
    //               child: Text('Explore Store',
    //                   style: primaryTextStyle.copyWith(
    //                     fontSize: 16,
    //                     fontWeight: medium,
    //                   )),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            children: [
              ChatTile(),
              ChatTile2(),
              ChatTile2(),
              ChatTile2(),
              ChatTile2(),
              ChatTile2(),
              ChatTile2(),
              ChatTile2(),
              ChatTile2(),
              ChatTile2(),
              ChatTile2(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyChat(),
        content(),
      ],
    );
  }
}
