import 'dart:async';

import 'package:flutter/material.dart';

import '../customized_widgets/custom_app_bar.dart';

class IndexedStackPage extends StatefulWidget {
  @override
  _IndexedStackPageState createState() => _IndexedStackPageState();
}

class _IndexedStackPageState extends State<IndexedStackPage> {
  var firstValue = 500;
  var secondValue = 100;
  var index = 0;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (t) {
      setState(() {
        firstValue++;
        secondValue--;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'IndexedStack',
          documentUrl:
              'https://api.flutter.dev/flutter/widgets/IndexedStack-class.html',
          videoUrl: 'https://youtu.be/_O0PPD1Xfbks',
        ),
        body: IndexedStack(
          index: index,
          children: [
            _Container(
              text: 'channel 1: $firstValue',
              color: Colors.red[500],
            ),
            _Container(
              text: 'channel 2:  $secondValue',
              color: Colors.blue[500],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              if (index == 1) {
                index = 0;
              } else {
                index++;
              }
            });
          },
          label: Text('Switch'),
        ));
  }
}

class _Container extends StatelessWidget {
  final String? text;
  final Color? color;

  const _Container({required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: color!,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        width: screenWidth / 2,
        height: screenWidth / 2,
        child: Text(
          text!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
