import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF202124),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/app_icon.png',
              width: screenWidth / 2,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,

                elevation: 3,
                minimumSize: Size(110, 37), //////// HERE
              ),
              onPressed: () {},
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
              child: Text(
                'By Tapping Get Started \nyou are agreeing to the Terms and Conditions.',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                _launchURL(
                    'https://www.privacypolicies.com/live/08ba4ed6-16f0-4327-b25a-3c4b2ba463fa');
              },
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
