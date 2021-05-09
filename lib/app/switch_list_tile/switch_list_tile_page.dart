import 'package:flutter/material.dart';

import '../customized_widgets/custom_app_bar.dart';

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
      appBar: CustomAppBar(
        title: 'SwitchListTile',
        documentUrl:
            'https://api.flutter.dev/flutter/material/SwitchListTile-class.html',
        videoUrl: 'https://youtu.be/0igIjvtEWNU',
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
}
