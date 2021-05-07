import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwitchListTilePage extends StatefulWidget {
  @override
  _SwitchListTilePageState createState() => _SwitchListTilePageState();
}

class _SwitchListTilePageState extends State<SwitchListTilePage> {
  bool _firstLight = false;
  bool _secondLight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchListTile'),
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
              ),
              onPressed: () {
                // _launchURL(_videoUrl);
              }),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bookOpen,
            ),
            onPressed: () {
              // _launchURL(_documentUrl);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SwitchListTile(
            subtitle: Text('This is a subtitle.'),
            title: const Text('Lights'),
            value: _firstLight,
            onChanged: (bool value) {
              setState(() {
                _firstLight = value;
              });
            },
            secondary: Icon(
              Icons.lightbulb_outline,
              color: _firstLight ? Colors.amber : null,
            ),
          ),
          SwitchListTile(
            subtitle: Text('This is a subtitle.'),
            title: const Text('Lights'),
            value: _secondLight,
            onChanged: (bool value) {
              setState(() {
                _secondLight = value;
              });
            },
            secondary: Icon(
              Icons.lightbulb_outline,
              color: _secondLight ? Colors.amber : null,
            ),
          ),
        ],
      ),
    );
  }

  final _documentUrl =
      'https://api.flutter.dev/flutter/material/SwitchListTile-class.html';

  final _videoUrl = 'https://youtu.be/0igIjvtEWNU';

  // void _launchURL(String _url) async => await canLaunch(_url)
  //     ? await launch(_url)
  //     : throw 'Could not launch $_url';
}
