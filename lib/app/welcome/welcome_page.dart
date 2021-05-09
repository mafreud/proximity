import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proximity/app/welcome/welcome_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final screenWidth = MediaQuery.of(context).size.width;
    final viewModel = watch(welcomeViewModelProvider);
    return Scaffold(
      backgroundColor: Color(0xFF202124),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset(
                'assets/images/app_icon.png',
                width: screenWidth / 2,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,

                elevation: 3,
                minimumSize: Size(110, 37), //////// HERE
              ),
              onPressed: () async {
                await viewModel.signUp();
              },
              child: Text('Get Started'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white10,
                elevation: 3,
                minimumSize: Size(110, 37), //////// HERE
              ),
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _launchURL(
                    'https://www.privacypolicies.com/live/08ba4ed6-16f0-4327-b25a-3c4b2ba463fa');
              },
              child: const Text(
                'By Tapping Get Started \nyou are agreeing to the Terms and Conditions.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
