import 'package:flutter/material.dart';
import 'package:travel_innsbruck_match/pages/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalScore = 0;
  int questionIndex = 0;
  final List<Map<String, dynamic>> challenges = [
    {
      'category': 'Historical Hunts',
      'challenges': [
        {
          'text': 'Take a selfie with the Golden Roof (Goldenes Dachl)!',
          'points': 10
        },
        {
          'text': 'Find and photograph the entrance of Ambras Castle.',
          'points': 10
        },
        {
          'text':
              'Spot and capture the Hofkirche’s ‘Black Men’ statues inside the church.',
          'points': 10
        },
      ],
    },
    {
      'category': 'Nature & Views',
      'challenges': [
        {
          'text': 'Capture a panoramic shot from Nordkette’s Seegrube station.',
          'points': 15
        },
        {
          'text': 'Find and take a photo of a cute animal at Alpenzoo.',
          'points': 15
        },
        {
          'text': 'Snap a picture of the Innsbruck skyline at sunset.',
          'points': 15
        },
      ],
    },
    {
      'category': 'Cultural & Foodie Challenges',
      'challenges': [
        {
          'text':
              'Take a photo of your Tiroler Gröstl (traditional dish) before eating it!',
          'points': 5
        },
        {
          'text':
              'Find a street musician in Innsbruck’s Old Town and snap a quick pic.',
          'points': 5
        },
        {'text': 'Photograph a cozy café with a mountain view.', 'points': 5},
      ],
    },
    {
      'category': 'Winter Sports & Adventure',
      'challenges': [
        {
          'text': 'Capture a ski jump moment at Bergisel Ski Jump.',
          'points': 20
        },
        {'text': 'Take a selfie in full ski gear on the slopes.', 'points': 20},
        {
          'text': 'Find and photograph an ice-skating rink in Innsbruck.',
          'points': 20
        },
      ],
    }
  ];

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'How do you prefer to spend your free time?',
      'image': 'images/image (16).png',
      'answers': [
        {'text': 'Exploring history and architecture', 'score': 10},
        {'text': 'Enjoying nature and landscapes', 'score': 15},
        {'text': 'Tasting local food', 'score': 5},
        {'text': 'Engaging in outdoor activities', 'score': 20},
      ]
    },
    {
      'question': 'How active are you on vacation?',
      'image': 'images/image (17).png',
      'answers': [
        {'text': 'I prefer to relax', 'score': 5},
        {'text': 'I enjoy light hikes', 'score': 10},
        {'text': 'I’m always on the move', 'score': 15},
        {'text': 'I seek extreme adventures', 'score': 20},
      ]
    },
    {
      'question': 'What kind of scenery do you prefer?',
      'image': 'images/image (18).png',
      'answers': [
        {'text': 'Historical buildings', 'score': 10},
        {'text': 'Mountains and breathtaking valleys', 'score': 20},
        {'text': 'Modern and urban areas', 'score': 5},
        {'text': 'Green and relaxing spaces', 'score': 15},
      ]
    },
    {
      'question': 'How much time do you have for exploring?',
      'image': 'images/image (19).png',
      'answers': [
        {'text': 'Just a few hours', 'score': 5},
        {'text': 'A full day', 'score': 10},
        {'text': 'A weekend', 'score': 15},
        {'text': 'Several days', 'score': 20},
      ]
    },
    {
      'question': 'What activities do you prefer?',
      'image': 'images/image (20).png',
      'answers': [
        {'text': 'Visiting museums and castles', 'score': 10},
        {'text': 'Mountain hiking and trails', 'score': 20},
        {'text': 'Shopping and gastronomy', 'score': 5},
        {'text': 'Extreme sports and adrenaline', 'score': 15},
      ]
    },
  ];

  String getAttractionRecommendation(int totalScore) {
    if (totalScore <= 40) {
      return '25 - 40 points: Old Town & Goldenes Dachl - Perfect for history and culture lovers.';
    } else if (totalScore <= 60) {
      return '41 - 60 points: Ambras Castle & Hofburg - Ideal for those who love imperial history.';
    } else if (totalScore <= 80) {
      return '61 - 80 points: Nordkette & Alpenzoo - Great for nature lovers and families.';
    } else {
      return '81 - 100 points: Bergisel Ski Jump & Ski Slopes - Best for adventure seekers!';
    }
  }

  void answerQuestion(int score) {
    setState(() {
      totalScore += score;
      questionIndex++;
    });

    if (questionIndex >= questions.length) {
      // Get the recommendation based on the total score
      String recommendation = getAttractionRecommendation(totalScore);

      // Navigate to ResultPage with the recommendation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: recommendation,
            totalScore: totalScore,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: questionIndex < questions.length
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: Column(
                              key: ValueKey<int>(questionIndex),
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    questions[questionIndex]['image'] ??
                                        'images/default.jpg', // Provide a default image path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      questions[questionIndex]['question'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  children: (questions[questionIndex]['answers']
                                          as List<Map<String, Object>>)
                                      .map((answer) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: SizedBox(
                                        width: width * 0.8,
                                        height: height * 0.07,
                                        child: ElevatedButton(
                                          onPressed: () => answerQuestion(
                                              answer['score'] as int),
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.blueGrey,
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 24),
                                          ),
                                          child: Text(
                                            answer['text'] as String,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
