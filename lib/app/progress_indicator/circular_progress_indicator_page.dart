import 'package:flutter/material.dart';

import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class CircularProgressIndicatorPage extends StatefulWidget {
  const CircularProgressIndicatorPage({Key? key}) : super(key: key);

  @override
  _CircularProgressIndicatorPageState createState() =>
      _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState
    extends State<CircularProgressIndicatorPage> {

  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'CircularProgressIndicator',
        documentUrl:
            'https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: _isShow,
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              child: CircularProgressIndicator()
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: ProximityColors.secondaryBlue),
              onPressed: () {
                setState(() {
                  _isShow = !_isShow;
                });
              },
              child: Text('circular'),
            )
          ],
        ),
      ),
    );
  }
}
