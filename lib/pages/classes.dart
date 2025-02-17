class Resultss {
  final String title;
  final String image;
  final String description;
  final String titlegrid;
  final String descriptiongrid;
  final String link;

  Resultss({
    required this.title,
    required this.image,
    required this.description,
    required this.titlegrid,
    required this.descriptiongrid,
    required this.link,
  });
}

class Challenge {
  final String title;
  final String image;
  final String description;
  final String titlegrid;
  final String descriptiongrid;
  final String link;

  Challenge({
    required this.title,
    required this.image,
    required this.description,
    required this.titlegrid,
    required this.descriptiongrid,
    required this.link,
  });
}

class Selected {
  final String title;
  final String image;
  bool isfromfile = false;

  Selected({
    required this.title,
    required this.image,
  });
}
