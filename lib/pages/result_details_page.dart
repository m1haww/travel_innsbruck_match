import 'package:flutter/material.dart';
import 'package:travel_innsbruck_match/pages/classes.dart';

class ResultDetailsPage extends StatefulWidget {
  final Resultss result;

  const ResultDetailsPage({super.key, required this.result});

  @override
  State<ResultDetailsPage> createState() => _ResultDetailsPageState();
}

class _ResultDetailsPageState extends State<ResultDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'images/salut.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Cleaner version of Navigator.pop()
              },
              child: const Icon(Icons.arrow_back),
            ),
            title: const Text(
              'Details',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Section
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          widget.result.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Title Section
                      Expanded(
                        child: Text(
                          widget.result.titlegrid,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Description Section with Icon
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.red.shade900,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // The short description of the place
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.result.descriptiongrid,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.justify, // Better readability
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
