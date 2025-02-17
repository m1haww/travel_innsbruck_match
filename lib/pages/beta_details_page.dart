import 'package:flutter/material.dart';
import 'package:travel_innsbruck_match/pages/base.dart';
import 'package:travel_innsbruck_match/pages/classes.dart';

class BetaDetailsPage extends StatefulWidget {
  final Selected challenge;

  const BetaDetailsPage({super.key, required this.challenge});

  @override
  State<BetaDetailsPage> createState() => _BetaDetailsPageState();
}

class _BetaDetailsPageState extends State<BetaDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'images/back.webp',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xffFF2727),
              ),
            ),
            title: buildbeta(context, widget.challenge.title),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    widget.challenge.isfromfile
                        ? Image.asset(
                            widget.challenge.image,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            widget.challenge.image,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.challenge.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFF2727),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                          "Experience the thrill and excitement of this challenge. Dive deep into the adventure and explore the wonders it has to offer!",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
