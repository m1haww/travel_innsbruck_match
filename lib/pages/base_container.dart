import 'package:flutter/material.dart';

Widget buildHeight(BuildContext context, double percentage) {
  final height = MediaQuery.of(context).size.height;
  return SizedBox(height: height * percentage);
}

Widget buildWidth(BuildContext context, double percentage) {
  final width = MediaQuery.of(context).size.width;
  return SizedBox(width: width * percentage);
}

Widget buildContainer(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    height: height * 0.06, // Increased height for better display
    width: width * 0.4, // Increased width for better space
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xffFF2727), // Set a background color
    ),
    child: Center(
      child: GestureDetector(
        onTap: () {
          // Add your logic here for "Start Now" action
        },
        child: const Text(
          "Start Now",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'J', // Apply your custom font family
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget buildContainerStart(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xffFF2727),
    ),
    child: const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How Does the Test Work?",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'J'), // Apply font family "J"
          ),
          SizedBox(height: 10), // Add space between the title and content
          Text(
            "1. The user selects answers.",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'J'), // Apply font family "J"
          ),
          SizedBox(height: 5),
          Text(
            "2. Each answer adds points.",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'J'), // Apply font family "J"
          ),
          SizedBox(height: 5),
          Text(
            "3. The total score is calculated.",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'J'), // Apply font family "J"
          ),
          SizedBox(height: 5),
          Text(
            "4. Based on the score, a recommendation is displayed.",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'J'), // Apply font family "J"
          ),
        ],
      ),
    ),
  );
}

Widget buildContainerBeta(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    height: height * 0.4, // Adjust the height accordingly to fit all content
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xffFF2727),
    ),
    child: SingleChildScrollView(
      // Wrapping with SingleChildScrollView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row: How to Play Section
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildWidth(context, 0.02),
                const Image(image: AssetImage("images/Frame (3).png")),
                const Expanded(
                  // Using Expanded widget to allow text to take remaining space
                  child: Text(
                    "How to Play?",
                    style: TextStyle(
                        fontFamily: "Ink",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          buildHeight(context, 0.02), // Vertical space between rows

          // Second Row: Choose a Challenge Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage("images/Ellipse 1.png")),
              buildWidth(context, 0.02),
              const Expanded(
                // Using Expanded widget to allow text to take remaining space
                child: Text(
                  "Choose a Challenge – Pick a mission from categories like History, Nature, Food, or Adventure",
                  style: TextStyle(
                      fontFamily: "Indi",
                      fontSize: 14,
                      color: Color(0xffF5F5F5),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          buildHeight(context, 0.02), // Vertical space between rows

          // Third Row: Additional instructions or content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage("images/Ellipse 1.png")),
              buildWidth(context, 0.02),
              const Expanded(
                // Using Expanded widget to allow text to take remaining space
                child: Text(
                  "Track Your Progress – Monitor your score as you complete each mission.",
                  style: TextStyle(
                      fontFamily: "Indi",
                      fontSize: 14,
                      color: Color(0xffF5F5F5),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          buildHeight(context, 0.02), // Vertical space between rows

          // Fourth Row: Additional instructions or content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage("images/Ellipse 1.png")),
              buildWidth(context, 0.02),
              const Expanded(
                // Using Expanded widget to allow text to take remaining space
                child: Text(
                  "Share and Compete – Challenge friends and see who gets the best score.",
                  style: TextStyle(
                      fontFamily: "Indi",
                      fontSize: 14,
                      color: Color(0xffF5F5F5),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          buildHeight(context, 0.02), // Vertical space between rows

          // Fifth Row: Additional instructions or content (Optional)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage("images/Ellipse 1.png")),
              buildWidth(context, 0.02),
              const Expanded(
                // Using Expanded widget to allow text to take remaining space
                child: Text(
                  "Complete the Challenge – Finish each mission for a reward and unlock more.",
                  style: TextStyle(
                      fontFamily: "Indi",
                      fontSize: 14,
                      color: Color(0xffF5F5F5),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildContainerBetaSecond(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    height: height * 0.9, // Adjust the height accordingly to fit all content
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xffFF2727),
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Historical Hunts Section
          buildChallengeRow(
            context,
            image: "images/Star 1.png",
            title: "Historical Hunts:",
            challenge: "Take a selfie with the Goldenes Dachl",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "Nature & Views",
            challenge: "Find and photograph the entrance of Ambras Castle",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "Cultural & Foodie Challenges",
            challenge:
                "Share and Compete – Challenge friends and see who gets the best score.",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "Winter Sports & Adventure",
            challenge:
                "Spot and capture the Hofkirche’s ‘Black Men’ statues inside the church",
          ),

          buildHeight(context, 0.02), // Vertical space between categories

          // Nature & Views Section
          buildChallengeRow(
            context,
            image: "images/Star 1.png",
            title: "Nature & Views:",
            challenge:
                "Capture a panoramic shot from Nordkette’s Seegrube station",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "",
            challenge: "Find and take a photo of a cute animal at Alpenzoo",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "",
            challenge: "Snap a picture of the Innsbruck skyline at sunset",
          ),

          buildHeight(context, 0.02), // Vertical space between categories

          // Cultural & Foodie Challenges Section
          buildChallengeRow(
            context,
            image: "images/Star 1.png",
            title: "Cultural & Foodie Challenges:",
            challenge: "Take a photo of your Tiroler Gröstl",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "",
            challenge:
                "Find a street musician in Innsbruck’s Old Town and snap a quick pic",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "",
            challenge: "Photograph a cozy café with a mountain view",
          ),

          buildHeight(context, 0.02), // Vertical space between categories

          // Winter Sports & Adventure Section
          buildChallengeRow(
            context,
            image: "images/Star 1.png",
            title: "Winter Sports & Adventure:",
            challenge: "Capture a ski jump moment at Bergisel Ski Jump",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "",
            challenge: "Take a selfie in full ski gear on the slopes",
          ),
          buildChallengeRow(
            context,
            image: "images/Frame (4).png",
            title: "",
            challenge: "Find and photograph an ice-skating rink in Innsbruck",
          ),
        ],
      ),
    ),
  );
}

Widget buildChallengeRow(BuildContext context,
    {required String image, required String title, required String challenge}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Title and Icon
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildWidth(context, 0.02),
          Image(image: AssetImage(image)),
          const Expanded(
            child: Text(
              "",
              style: TextStyle(
                  fontFamily: "Ink",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      buildHeight(context, 0.02), // Vertical space between rows

      // Challenge Description
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(image: AssetImage("images/Frame (4).png")),
          buildWidth(context, 0.02),
          Expanded(
            child: Text(
              challenge,
              style: const TextStyle(
                  fontFamily: "Indi",
                  fontSize: 14,
                  color: Color(0xffF5F5F5),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
      buildHeight(context, 0.02), // Vertical space between rows
    ],
  );
}
