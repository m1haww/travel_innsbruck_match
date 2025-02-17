import 'package:flutter/material.dart';

Widget buildquestiontext(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w400),
  );
}

Widget buildquestiontitle(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 13,
        color: Colors.black,
        fontWeight: FontWeight.w400),
  );
}

Widget buildtitleapp(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 20,
        color: Color(0xffF5F5F5),
        fontWeight: FontWeight.w400),
  );
}

Widget buildstartnow(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400),
    maxLines: 3,
  );
}

Widget buildhowthetestwork(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 11,
        color: Colors.black,
        fontWeight: FontWeight.w400),
  );
}

Widget buildResults(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w400),
  );
}

Widget buildunderresults(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w400),
  );
}

Widget buildunderresultsdescription(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.w400),
  );
}

Widget buildtextgridinfo(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 15,
        color: Colors.red,
        fontWeight: FontWeight.w700),
  );
}

Widget buildtextdescritpion(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: "J",
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.w400),
  );
}

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
