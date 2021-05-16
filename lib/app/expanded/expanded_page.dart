import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';

class ExpandedPage extends StatefulWidget {
  @override
  _ExpandedPageState createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  var _widthValue = 5.0;
  var firstFlex = 2;
  var secondFlex = 1;
  var thirdFlex = 3;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Expanded',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/Expanded-class.html',
        videoUrl: 'https://youtu.be/_rnZaagadyo',
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, right: 8.0, left: 8.0, bottom: 50),
              child: Slider(
                value: _widthValue,
                min: 1,
                max: 10,
                divisions: 50,
                label: '${(_widthValue * 10).round().toString()}%',
                onChanged: (double value) {
                  setState(() {
                    _widthValue = value;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
              ),
              width: screenWidth * 0.9,
              height: screenHeight * 0.7 * _widthValue / 10,
              child: Column(
                children: [
                  Expanded(
                    flex: firstFlex,
                    child: Container(
                      width: screenWidth / 2,
                      color: Colors.blue,
                      child: Center(child: Text('flex:$firstFlex')),
                    ),
                  ),
                  Expanded(
                    flex: secondFlex,
                    child: Container(
                      width: screenWidth / 2,
                      color: Colors.teal,
                      child: Center(
                        child: Text('flex:$secondFlex'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: thirdFlex,
                    child: Container(
                      width: screenWidth / 2,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text('flex:$thirdFlex'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            firstFlex = randomNumber;
            secondFlex = randomNumber;
            thirdFlex = randomNumber;
          });
        },
        label: Text('Switch'),
      ),
    );
  }

  int get randomNumber {
    final random = Random();
    final randomNumber = random.nextInt(9) + 1;
    return randomNumber;
  }
}
