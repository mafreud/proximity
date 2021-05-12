import 'package:flutter/material.dart';

import '../customized_widgets/custom_app_bar.dart';

class ScrollbarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'RotatedBox',
        documentUrl:
            'https://api.flutter.dev/flutter/material/Scrollbar-class.html',
        videoUrl: 'https://www.youtube.com/watch?v=DbkIQSvwnZc',
      ),
      body: Scrollbar(
        thickness: 10,
        child: ListView.builder(
          itemCount: _colorList.length,
          itemBuilder: (context, index) {
            final _color = _colorList[index];
            return Card(
              elevation: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      color: _color,
                      height: 30,
                      width: 30,
                    ),
                    title: Text('Sample Card'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  final _colorList = [
    Colors.amber,
    Colors.amberAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.indigo,
    Colors.red,
    Colors.redAccent,
    Colors.teal,
    Colors.tealAccent,
    Colors.white,
    Colors.yellow,
    Colors.yellowAccent,
  ];
}
