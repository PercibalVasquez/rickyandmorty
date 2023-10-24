import 'package:flutter/material.dart';

Widget cardData(String textl, String text2) {
  return Expanded(
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(textl),
          Text(
            text2,
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    ),
  );
}
