import 'package:flutter/material.dart';
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
  final TextEditingController _challengeController = TextEditingController();
  bool _isFormValid() {
    return _challengeController.text.isNotEmpty &&
        _selectedChallenge!.image.isNotEmpty &&
        _selectedChallenge!.title.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProviderPage>(context);
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
                _challengeController.text = challenge.image;
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
            ? null
            : () async {
                _isFormValid();
                Navigator.pop(context);
                Navigator.pop(context);
              },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _selectedChallenge != null ? Colors.white : Colors.grey,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: const Text("Save Challenge"),
      ),
    );
  }
}
