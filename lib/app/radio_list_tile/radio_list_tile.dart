import 'package:flutter/material.dart';

import '../customized_widgets/custom_app_bar.dart';

enum SingingCharacter { lafayette, jefferson }

class RadioListTilePage extends StatefulWidget {
  @override
  _RadioListTilePageState createState() => _RadioListTilePageState();
}

class _RadioListTilePageState extends State<RadioListTilePage> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'RadioListTile',
        documentUrl:
            'https://api.flutter.dev/flutter/material/RadioListTile-class.html',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile<SingingCharacter>(
              title: const Text('Lafayette'),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
