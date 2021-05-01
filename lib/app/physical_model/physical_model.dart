import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PhysicalModelPage extends StatefulWidget {
  @override
  _PhysicalModelPageState createState() => _PhysicalModelPageState();
}

class _PhysicalModelPageState extends State<PhysicalModelPage> {
  bool isSwitched = false;
  bool isAnimatedSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhysicalModel'),
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'PhysicalModel',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              PhysicalModel(
                child: Container(
                  color: Colors.teal,
                  height: 200,
                  width: 200,
                ),
                color: Colors.amber,
                shadowColor: Colors.black,
                elevation: isSwitched ? 50 : 0,
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeTrackColor: Colors.white,
                activeColor: Colors.teal,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'AnimatedPhysicalModel',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                shape: BoxShape.rectangle,
                child: Container(
                  color: Colors.teal,
                  height: 200,
                  width: 200,
                ),
                borderRadius: isAnimatedSwitched
                    ? const BorderRadius.all(Radius.circular(0))
                    : const BorderRadius.all(Radius.circular(10)),
                color: Colors.amber,
                shadowColor: Colors.black,
                elevation: isAnimatedSwitched ? 50 : 0,
              ),
              Switch(
                value: isAnimatedSwitched,
                onChanged: (value) {
                  setState(() {
                    isAnimatedSwitched = value;
                  });
                },
                activeTrackColor: Colors.white,
                activeColor: Colors.teal,
              )
            ],
          ),
        ),
      ),
    );
  }

  final _documentUrl =
      'https://api.flutter.dev/flutter/widgets/PhysicalModel-class.html';

  final _videoUrl = 'https://www.youtube.com/watch?v=XgUOSS30OQk';

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
