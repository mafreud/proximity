import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class AnimatedPositionedPage extends StatefulWidget {
  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'AnimatedPositioned',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html',
        videoUrl: 'https://youtu.be/hC3s2YdtWt8',
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: screenHeight * 0.6,
              width: screenWidth * 0.9,
              color: ProximityColors.secondaryBlue,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Stack Widget',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Rate my app 😆',
                style: TextStyle(fontSize: screenWidth / 20),
              ),
            ),
            AnimatedPositioned(
              top: selected ? screenHeight / 3.0 : screenHeight / 2.4,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(seconds: 1),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: Material(
                  elevation: 10,
                  child: Container(
                    color: ProximityColors.flutterBlue,
                    height: screenHeight / 15,
                    width: screenWidth / 2,
                    child: Align(
                      child: Text(
                        'tap me 🤩',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
