import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ScrollbarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollbar'),
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
              ),
              onPressed: () {
                _launchURL(_videoUrl);
              }),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bookOpen,
            ),
            onPressed: () {
              _launchURL(_documentUrl);
            },
          ),
        ],
      ),
      body: Scrollbar(
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

  final _documentUrl =
      'https://api.flutter.dev/flutter/material/Scrollbar-class.html';
  final _videoUrl = 'https://www.youtube.com/watch?v=DbkIQSvwnZc';
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

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
