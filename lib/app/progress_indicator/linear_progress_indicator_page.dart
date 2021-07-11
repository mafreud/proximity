import 'package:flutter/material.dart';

import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class LinearProgressIndicatorPage extends StatefulWidget {
  const LinearProgressIndicatorPage({Key? key}) : super(key: key);

  @override
  _LinearProgressIndicatorPageState createState() => _LinearProgressIndicatorPageState();
}

class _LinearProgressIndicatorPageState extends State<LinearProgressIndicatorPage> {

  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'LinearProgressIndicator',
        documentUrl:
        'https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Visibility(
                  visible: _isShow,
                  maintainState: true,
                  maintainSize: true,
                  maintainAnimation: true,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                  )
              ),
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
              child: Text('linear'),
            )
          ],
        ),
      ),
    );
  }
}
