import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final selectedChallenge = model.selectedChallenge;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'images/salut.jpg',
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
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 10),

                    if (selectedChallenge != null)
                      ListTile(
                        leading: Image.asset(
                          selectedChallenge.image,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          selectedChallenge.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    else
                      const Text(
                        "No Challenge Selected",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    const SizedBox(height: 20),

                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const BetaSecondPage(),
                          ),
                        );
                      },
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
}
