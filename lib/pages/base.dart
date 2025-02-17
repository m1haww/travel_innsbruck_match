import 'package:flutter/material.dart';

Widget buildbeta(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "I",
        fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.w400),
  );
}

Widget buildbetasecond(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "Ink",
        fontSize: 18,
        color: Colors.red,
        fontWeight: FontWeight.w400),
  );
}

Widget buildbetasthird(BuildContext context, String text) {
  return SizedBox(
    width: double.infinity,
    child: Text(
      text,
      style: const TextStyle(
          fontFamily: "Indi",
          fontSize: 17,
          color: Colors.red,
          fontWeight: FontWeight.w400),
      maxLines: 2,
    ),
  );
}
