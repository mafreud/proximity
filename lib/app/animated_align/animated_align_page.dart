import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'AlignTransition',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/AlignTransition-class.html',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: ProximityColors.secondaryBlue,
              height: screenWidth / 1.3,
              width: screenWidth / 1.3,
              child: AnimatedAlign(
                alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  color: ProximityColors.flutterBlue,
                  height: screenWidth / 4,
                  width: screenWidth / 4,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Text('Tap me!'),
            )
          ],
        ),
      ),
    );
  }
}
