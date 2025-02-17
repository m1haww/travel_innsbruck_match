import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_innsbruck_match/pages/app_provider_page.dart';
import 'package:travel_innsbruck_match/pages/base.dart';
import 'package:travel_innsbruck_match/pages/base_container.dart';
import 'package:travel_innsbruck_match/pages/quiz_page.dart';

class Alfa extends StatefulWidget {
  const Alfa({super.key});

  @override
  State<Alfa> createState() => _AlfaState();
}

class _AlfaState extends State<Alfa> {
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
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildHeight(context, 0.02),
                buildContainer(context, () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => QuizPage(),
                      ));
                }),
                buildHeight(context, 0.02),
                buildContainerStart(context),
                buildHeight(context, 0.02),
                buildHeight(context, 0.02),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
