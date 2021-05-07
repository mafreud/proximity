import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';

class RotatedBoxPage extends StatefulWidget {
  @override
  _RotatedBoxPageState createState() => _RotatedBoxPageState();
}

class _RotatedBoxPageState extends State<RotatedBoxPage> {
  int quarterTurns = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'RotatedBox',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/RotatedBox-class.html',
        videoUrl: 'https://www.youtube.com/watch?v=BFE6_UglLfQ',
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: quarterTurns,
                  child: Container(
                    color: Colors.teal,
                    height: 100,
                    width: 300,
                    child: Center(
                      child: Text(
                        'Proximity',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.purple[900],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: IconButton(
                iconSize: 70,
                icon: Icon(
                  Icons.rotate_left,
                ),
                onPressed: () {
                  setState(() {
                    if (quarterTurns == 3) {
                      quarterTurns = 1;
                    } else {
                      quarterTurns++;
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
