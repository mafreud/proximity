import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';

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
        children: [
          AnimatedPadding(
            padding: EdgeInsets.all(padValue),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              color: Colors.blue,
            ),
          ),
          Text('Padding: $padValue'),
          ElevatedButton(
              child: const Text('Change padding'),
              onPressed: () {
                _updatePadding(padValue == 0.0 ? 100.0 : 0.0);
              }),
        ],
      ),
    );
  }
}
