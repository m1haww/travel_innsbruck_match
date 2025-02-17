import 'package:flutter/material.dart';
import 'package:travel_innsbruck_match/pages/classes.dart';

class AppProviderPage extends ChangeNotifier {
  var directorypath = "";
  final List<Selected> challenges = [
    Selected(title: "Selfie with Goldenes Dachl", image: "images/1.jpg"),
    Selected(title: "Find Ambras Castle Entrance", image: "images/2.jpg"),
    Selected(title: "Take a sunset skyline pic", image: "images/3.webp"),
    Selected(title: "Snap a Tiroler Gröstl meal", image: "images/4.jpg"),
  ];

  // List of selected challenges
  final List<Selected> _selectedChallenges = [];

  List<Selected> get selectedChallenges => _selectedChallenges;

  // Method to add a challenge to the selected list
  void selectChallenge(Selected challenge) {
    if (!_selectedChallenges.contains(challenge)) {
      _selectedChallenges.add(challenge);
      notifyListeners();
    }
  }

  void addChallenge(Selected challenge) {
    _selectedChallenges.add(challenge);
    notifyListeners();
  }

  // Method to delete a challenge from the selected list
  void deleteChallenge(Selected challenge) {
    _selectedChallenges.remove(challenge);
    notifyListeners();
  }

  ThemeMode _themeMode = ThemeMode.system; // Implicit urmează tema sistemului

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  final List<Resultss> results = [
    Resultss(
      title: "25 - 40 points: Old Town & Goldenes Dachl",
      description:
          "Perfect for history and culture lovers who prefer a relaxed exploration of Innsbruck.",
      image: "images/image (21).png",
      titlegrid: "Old Town & Goldenes Dachl",
      descriptiongrid:
          "A place perfect for history and culture lovers who prefer a relaxed exploration of Innsbruck. This area is rich in history, offering many landmarks to explore at a relaxed pace.",
      link:
          "https://www.google.com/maps/place/old+town+%26+goldenes+dachl+in+innsbruck/data=!4m2!3m1!1s0x479d6bfbc8328303:0x8d9302ea95bbd0e5?sa=X&ved=1t:155783&ictx=111",
    ),
    Resultss(
      title: "41 - 60 points: Ambras Castle & Hofburg",
      description:
          "Recommended for those interested in imperial history and ancient architecture.",
      image: "images/image (22).png",
      titlegrid: "Ambras Castle & Hofburg",
      descriptiongrid:
          "Recommended for those interested in imperial history and ancient architecture. These places offer stunning architectural designs and rich historical value.",
      link:
          "https://www.google.com/maps/search/+Ambras/@47.2566008,11.431044,17z/data=!3m1!4b1?entry=ttu&g_ep=EgoyMDI1MDIwNS4xIKXMDSoASAFQAw%3D%3D", // Add link here
    ),
    Resultss(
      title: "61 - 80 points: Nordkette & Alpenzoo",
      description:
          "Ideal for nature enthusiasts who enjoy scenic landscapes and outdoor fun.",
      image: "images/image (23).png",
      titlegrid: "Nordkette & Alpenzoo",
      descriptiongrid:
          "Ideal for nature enthusiasts who enjoy scenic landscapes and outdoor fun. The breathtaking views and variety of wildlife make it an unforgettable experience.",
      link:
          "https://www.innsbruck.info/en/destinations/arrival-and-transport/detail/infrastruktur/innsbrucker-nordkettenbahnen-cable-cars-innsbruck.html", // Add link here
    ),
    Resultss(
        title: "81+ points: Bergisel Ski Jump & Ski Slopes",
        description:
            "Perfect for adventure seekers looking for thrilling experiences in the mountains!",
        image: "images/image (24).png",
        titlegrid: "Bergisel Ski Jump & Ski Slopes",
        descriptiongrid:
            "Perfect for adventure seekers looking for thrilling experiences in the mountains! This is the place for skiing, snowboarding, and even watching ski-jumping competitions.",
        link:
            "https://www.google.com/maps/place/Bergisel/@47.2490579,11.3994845,17z/data=!4m6!3m5!1s0x479d6963934fa9bd:0x865d9a85749a1fa6!8m2!3d47.2490579!4d11.3994845!16s%2Fm%2F0288f4f?entry=ttu&g_ep=EgoyMDI1MDIwNS4xIKXMDSoASAFQAw%3D%3D"),
  ];
}
