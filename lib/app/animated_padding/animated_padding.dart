import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class AnimatedPaddingPage extends StatefulWidget {
  @override
  _AnimatedPaddingPageState createState() => _AnimatedPaddingPageState();
}

class _AnimatedPaddingPageState extends State<AnimatedPaddingPage> {
  double padValue = 0.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'AnimatedPadding',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/AnimatedPadding-class.html',
        videoUrl: 'https://youtu.be/PY2m0fhGNz4',
        isVideoAvailable: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ProximityColors.primaryBlue),
              ),
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: AnimatedPadding(
                padding: EdgeInsets.symmetric(horizontal: padValue),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Container(color: ProximityColors.primaryBlue),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Padding: $padValue'),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(primary: ProximityColors.primaryBlue),
            onPressed: () {
              _updatePadding(padValue == 0.0 ? 80.0 : 0.0);
            },
            child: const Text('Change padding'),
          ),
        ],
      ),
    );
  }
}
