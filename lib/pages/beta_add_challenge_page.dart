import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travel_innsbruck_match/pages/app_provider_page.dart';
import 'package:travel_innsbruck_match/pages/classes.dart';

class BetaAddChallengePage extends StatefulWidget {
  const BetaAddChallengePage({super.key});

  @override
  _BetaAddChallengePageState createState() => _BetaAddChallengePageState();
}

class _BetaAddChallengePageState extends State<BetaAddChallengePage> {
  Selected? _selectedChallenge;
  File? _selectedImage;
  Uint8List? _imageData;
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery and cache it
  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print("Image selected: ${pickedImage.path}");

      if (kIsWeb) {
        Uint8List imageBytes = await pickedImage.readAsBytes();
        setState(() {
          _imageData = imageBytes;
        });
      } else {
        final directory = await getTemporaryDirectory();
        final cachedImage = File('${directory.path}/${pickedImage.name}');
        await File(pickedImage.path).copy(cachedImage.path);

        setState(() {
          _selectedImage = cachedImage;
          print("Image cached at: ${cachedImage.path}");
        });
      }
    } else {
      print("No image selected.");
    }
  }

  final TextEditingController _challengeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProviderPage>(context);
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
            backgroundColor: Colors.transparent,
            title: const Text(
              'Innsbruck Photo Challenge',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Write your own challenge:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  _buildTextInput(),
                  const SizedBox(height: 20),
                  buildImage(context, _selectedImage, _imageData, _pickImage),
                  const SizedBox(height: 20),
                  const Text(
                    "Or select from existing challenges:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  _buildChallengeGrid(model),
                  const SizedBox(height: 20),
                  _buildSaveButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        cursorColor: Color(0xffFF2727),
        controller: _challengeController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Type your challenge...",
        ),
        onChanged: (value) {
          setState(() {
            _selectedChallenge = Selected(title: value, image: '');
          });
        },
      ),
    );
  }

  Widget _buildChallengeGrid(AppProviderPage model) {
    return Expanded(
      child: GridView.builder(
        itemCount: model.challenges.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final challenge = model.challenges[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedChallenge =
                    Selected(title: challenge.title, image: challenge.image);
                _challengeController.text =
                    challenge.title; // Display the title in the text field
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _selectedChallenge?.title == challenge.title
                      ? Colors.blueAccent
                      : Colors.transparent,
                  width: 2,
                ),
                image: DecorationImage(
                  image: AssetImage(challenge.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.6),
                  child: Text(
                    challenge.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _selectedChallenge == null
            ? () {
                // Show a message if no challenge is selected
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('You didn\'t choose a challenge yet.')),
                );
              }
            : () async {
                final provider =
                    Provider.of<AppProviderPage>(context, listen: false);

                // Save the selected challenge, with image data if available
                final challenge = Selected(
                  title: _challengeController.text,
                  image: _selectedImage?.path ?? 'default_image_path',
                );

                provider.addChallenge(challenge);
                Navigator.pop(context);
                Navigator.pop(context);
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedChallenge != null
              ? Colors.black
              : const Color(0xffFF2727),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: const Text(
          "Save Challenge",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context, File? selectedImage,
      Uint8List? imageData, VoidCallback onTap) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.23,
        height: height * 0.23,
        decoration: BoxDecoration(
          color: const Color(0xffECECEC),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.red,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: selectedImage == null && imageData == null
              ? Center(child: Icon(Icons.add))
              : (selectedImage != null
                  ? Image.file(selectedImage, fit: BoxFit.cover)
                  : Image.memory(imageData!, fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
