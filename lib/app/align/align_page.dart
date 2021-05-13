import 'package:flutter/material.dart';

import '../customized_widgets/custom_app_bar.dart';

class AlignPage extends StatefulWidget {
  @override
  _AlignPageState createState() => _AlignPageState();
}

enum SampleAlignment {
  bottomCenter,
  bottomLeft,
  bottomRight,
  center,
  centerLeft,
  centerRight,
  topCenter,
  topLeft,
  topRight
}

class _AlignPageState extends State<AlignPage> {
  SampleAlignment? _position = SampleAlignment.center;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Align',
        documentUrl: 'https://api.flutter.dev/flutter/widgets/Align-class.html',
        videoUrl: 'https://youtu.be/g2E7yl3MwMk',
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 17,
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                width: screenWidth * 0.4,
                height: screenHeight * 0.2,
                child: Align(
                  alignment: getAlignment(_position!),
                  child: Container(
                    color: Colors.white,
                    height: screenWidth / 7,
                    width: screenWidth / 7,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 17,
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth / 5),
                child: Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: SampleAlignment.values.length,
                    itemBuilder: (context, index) {
                      return RadioListTile<SampleAlignment>(
                        title: Text(SampleAlignment.values[index]
                            .toString()
                            .split('.')
                            .last),
                        value: SampleAlignment.values[index],
                        groupValue: _position,
                        onChanged: (SampleAlignment? value) {
                          setState(() {
                            _position = value;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Alignment getAlignment(SampleAlignment input) {
    switch (input) {
      case SampleAlignment.bottomCenter:
        return Alignment.bottomCenter;
      case SampleAlignment.bottomLeft:
        return Alignment.bottomLeft;
      case SampleAlignment.bottomRight:
        return Alignment.bottomRight;
      case SampleAlignment.center:
        return Alignment.center;
      case SampleAlignment.centerLeft:
        return Alignment.centerLeft;
      case SampleAlignment.centerRight:
        return Alignment.centerRight;
      case SampleAlignment.topCenter:
        return Alignment.topCenter;
      case SampleAlignment.topLeft:
        return Alignment.topLeft;
      case SampleAlignment.topRight:
        return Alignment.topRight;
      default:
        return Alignment.center;
    }
  }
}
