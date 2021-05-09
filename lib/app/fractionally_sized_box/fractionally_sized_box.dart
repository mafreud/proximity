import 'package:flutter/material.dart';

import '../customized_widgets/custom_app_bar.dart';

class FractionallySizedBoxPage extends StatefulWidget {
  @override
  _FractionallySizedBoxPageState createState() =>
      _FractionallySizedBoxPageState();
}

class _FractionallySizedBoxPageState extends State<FractionallySizedBoxPage> {
  var _value = 1.0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'FractionallySizedBox',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/FractionallySizedBox-class.html',
        videoUrl: 'https://youtu.be/PEsY654EGZ0',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left: 8.0,
                bottom: 50,
              ),
              child: Slider(
                value: _value,
                min: 1,
                max: 10,
                divisions: 50,
                label: '${(_value * 10).round().toString()}%',
                onChanged: (double value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
              ),
              width: screenWidth * 0.8,
              height: screenHeight * 0.5,
              child: FractionallySizedBox(
                widthFactor: _value / 10,
                heightFactor: _value / 10,
                child: Container(
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
