import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:travel_innsbruck_match/pages/classes.dart';
import 'package:travel_innsbruck_match/pages/selected_details_page.dart';
import 'app_provider_page.dart';
import 'base.dart';
import 'base_container.dart';
import 'beta_second_page.dart';

class Beta extends StatefulWidget {
  const Beta({super.key});

  @override
  State<Beta> createState() => _BetaState();
}

class _BetaState extends State<Beta> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProviderPage>(context);
    final selectedChallenge = model.selectedChallenges;

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
            centerTitle: true,
            title: buildbeta(context, "Innsbruck Photo Challenge"),
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeight(context, 0.04),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.party_mode_sharp),
                        buildWidth(context, 0.02),
                        buildbetasecond(
                            context, "What is the Photo Challenge?"),
                      ],
                    ),
                    buildHeight(context, 0.02),
                    buildbetasthird(context,
                        "The Innsbruck Photo Challenge is a fun \n and interactive way to explore the city!"),
                    buildHeight(context, 0.03),
                    buildContainerBeta(context),

                    // Display the selected challenge
                    const SizedBox(height: 20),
                    const Text(
                      "Selected Challenge:",
                      style: TextStyle(color: Color(0xffFF2727), fontSize: 18),
                    ),
                    const SizedBox(height: 10),

                    _buildSelectChallenge(selectedChallenge),

                    const SizedBox(height: 20),

                    Align(
                      alignment:
                          Alignment.centerRight, // Așează butonul în dreapta
                      child: FloatingActionButton(
                        backgroundColor: Color(0xffFF2727),

                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const BetaSecondPage(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ), // Adaugă o pictogramă pentru buton
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectChallenge(List<Selected> challenges) {
    if (challenges.isEmpty) {
      return const Text(
        "No challenges selected.",
        style: TextStyle(
          color: Color(0xffFF2727),
        ),
      );
    }

    return Column(
      children: challenges.map((challenge) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: _buildSelectCard(challenge),
        );
      }).toList(),
    );
  }

  Widget _buildSelectCard(Selected challenge) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFF2727),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(
              children: [
                Image.asset(
                  challenge.image,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 5, // Position the text 10 pixels from the bottom
                  left: 5, // Position the text 10 pixels from the left
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors
                          .black54, // Semi-transparent black background to improve readability
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      challenge.title,
                      style: const TextStyle(
                        fontFamily: "Sf",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xffFF2727),
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(1, 1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showActionSheet(BuildContext context, Selected challenge) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text(
                        "Delete the reservation?",
                        style: TextStyle(
                            fontFamily: "Sf",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      content: const Text(
                        "Are you sure that you want to delete the reservation?",
                        style: TextStyle(
                            fontFamily: "Sf",
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () async {
                            final provider = Provider.of<AppProviderPage>(
                                context,
                                listen: false);

                            await Future.delayed(
                                const Duration(milliseconds: 300));

                            setState(() {
                              provider.deleteChallenge(challenge);
                            });

                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          isDestructiveAction: true,
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                                fontFamily: "Sf",
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFF0E0A)),
                          ),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: "Sf",
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffDCA23D)),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              isDestructiveAction: true,
              child: const Text(
                "Delete",
                style: TextStyle(
                    fontFamily: "Sf",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFF0E0A)),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                    fontFamily: "Sf",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffDCA23D)),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Close",
              style: TextStyle(
                  fontFamily: "Sf",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffDCA23D)),
            ),
          ),
        );
      },
    );
  }
}
