import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';

class FlexiblePage extends StatefulWidget {
  @override
  _FlexiblePageState createState() => _FlexiblePageState();
}

class _FlexiblePageState extends State<FlexiblePage> {
  var _widthValue = 10.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Flexible',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/Flexible-class.html',
        videoUrl: 'https://youtu.be/CI7x0mAZiY0',
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
                border: Border.all(color: Colors.transparent, width: 1),
              ),
              width: screenWidth * 0.9,
              height: screenHeight * 0.5,
              child: FractionallySizedBox(
                widthFactor: _widthValue / 10,
                heightFactor: _widthValue / 10,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: _Container(),
                            ),
                            Flexible(
                              flex: 1,
                              child: _Container(),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: _Container(),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: _Container(),
                            ),
                            Flexible(
                              flex: 1,
                              child: _Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
