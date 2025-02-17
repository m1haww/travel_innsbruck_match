import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final Uri _url = Uri.parse(
      'https://www.termsfeed.com/live/2a5b4bbd-adcc-4a50-a15b-d7b3cc3df457');

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  final InAppReview inAppReview = InAppReview.instance;

  // Function to handle "Rate Us" action
  Future<void> _rateApp() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview(); // In-app review request
    } else {
      // If in-app review is not available, open the store listing
      inAppReview.openStoreListing(
          appStoreId: 'YOUR_APP_STORE_ID'); // Replace with your App Store ID
    }
  }

  @override
  Widget build(BuildContext context) {
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
            title: const Text("Settings",
                style: TextStyle(
                  fontSize: 20,
                )),
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            //images/back.webp
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: _launchUrl,
                      child: buildButton(context, "PRIVACY POLICY", () {})),
                  GestureDetector(
                      onTap: _launchUrl,
                      child: const Divider(height: 30, thickness: 2)),
                  buildButton(context, "TERMS OF SERVICE", () {}),
                  const Divider(height: 30, thickness: 2),
                  GestureDetector(
                      onTap: _rateApp,
                      child: buildButton(context, "RATE US", () {})),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget buildButton(
    BuildContext context,
    String text,
    VoidCallback onPressed, {
    Color color = Colors.redAccent,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
