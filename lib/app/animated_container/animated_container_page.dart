import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  var _selected = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'AnimatedContainer',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html',
        isVideoAvailable: true,
        videoUrl: 'https://youtu.be/yI-8QHpGIP4',
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _selected = !_selected;
            });
          },
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 10,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: _selected
                    ? ProximityColors.secondaryBlue
                    : ProximityColors.flutterBlue,
                border: Border.all(
                  width: 3.0,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              height: _selected ? screenWidth / 1.3 : screenWidth / 2,
              width: screenWidth / 1.3,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Align(
                child: _selected
                    ? Text(
                        'tap me 🥰',
                        style: TextStyle(fontSize: screenWidth / 11),
                      )
                    : Text(
                        'Thanks 😊',
                        style: TextStyle(fontSize: screenWidth / 11),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
