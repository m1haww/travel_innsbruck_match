import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_innsbruck_match/pages/beta_add_challenge_page.dart';
import 'package:travel_innsbruck_match/pages/beta_add_photo.dart';

class BetaSecondPage extends StatelessWidget {
  const BetaSecondPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    _buildCategory('Historical Hunts', [
                      'Take a selfie with the Goldenes Dachl',
                      'Find and photograph the entrance of Ambras Castle',
                      'Spot and capture the Hofkirche’s ‘Black Men’ statues inside the church',
                    ]),
                    _buildCategory('Nature & Views', [
                      'Capture a panoramic shot from Nordkette’s Seegrube station',
                      'Find and take a photo of a cute animal at Alpenzoo',
                      'Snap a picture of the Innsbruck skyline at sunset',
                    ]),
                    _buildCategory('Cultural & Foodie Challenges', [
                      'Take a photo of your Tiroler Gröstl',
                      'Find a street musician in Innsbruck’s Old Town and snap a quick pic',
                      'Photograph a cozy café with a mountain view',
                    ]),
                    _buildCategory('Winter Sports & Adventure', [
                      'Capture a ski jump moment at Bergisel Ski Jump',
                      'Take a selfie in full ski gear on the slopes',
                      'Find and photograph an ice-skating rink in Innsbruck',
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton('+ Add a photo', () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const BetaAddPhoto(),
                      ));
                }),
                _buildActionButton(
                  '+ Add a challenge',
                  () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                const BetaAddChallengePage()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String title, List<String> challenges) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\u2B50 $title:',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          ...challenges.map((challenge) => _buildChallengeItem(challenge)),
        ],
      ),
    );
  }

  Widget _buildChallengeItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(text),
    );
  }
}
