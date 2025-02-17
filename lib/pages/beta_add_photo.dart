import 'package:flutter/material.dart';

class BetaAddPhoto extends StatefulWidget {
  const BetaAddPhoto({super.key});

  @override
  State<BetaAddPhoto> createState() => _BetaAddPhotoState();
}

class _BetaAddPhotoState extends State<BetaAddPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade700,
      appBar: AppBar(
        title: const Text(
          'Innsbruck Photo Challenge',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildContainer(context, 0.04)],
        ),
      )),
    );
  }

  Widget buildContainer(BuildContext context, double percentage) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double size = screenWidth * (percentage / 100);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white, // Set a background color
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            // Add your logic here for "Start Now" action
          },
        ),
      ),
    );
  }
}
