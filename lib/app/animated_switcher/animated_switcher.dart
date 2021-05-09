import 'package:flutter/material.dart';

import '../customized_widgets/custom_app_bar.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  var isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'AnimatedSwitcher',
        documentUrl:
            'https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html',
        videoUrl: 'https://youtu.be/2W7POjFb88g',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (widget, animation) => ScaleTransition(
                scale: animation,
                child: widget,
              ),
              child: isFirst
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.teal,
                      ),
                      key: UniqueKey(),
                      width: 100,
                      height: 200,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.amber,
                      ),
                      key: UniqueKey(),
                      width: 200,
                      height: 100,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        label: Text(
          'Switch',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            isFirst = !isFirst;
          });
        },
      ),
    );
  }
}
