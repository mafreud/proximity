import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  var _currentSliderValue = 1.0;
  var _rangeValues = RangeValues(1.0, 50.0);
  var _cupertinoValue = 1.0;
  var _adaptiveValue = 5.0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Slider',
        documentUrl:
            'https://api.flutter.dev/flutter/material/Slider-class.html',
        videoUrl: 'https://youtu.be/ufb4gIPDmEs',
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: screenHeight / 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Text('Slider'),
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Text('RangeSlider'),
                ),
                RangeSlider(
                  values: _rangeValues,
                  min: 0,
                  max: 100,
                  labels: RangeLabels(
                      '${_rangeValues.start}', '${_rangeValues.end}'),
                  onChanged: (newRange) {
                    setState(() {
                      _rangeValues = newRange;
                    });
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Text('CupertinoSlider'),
                ),
                Container(
                  width: screenWidth * 0.92,
                  child: CupertinoSlider(
                    value: _cupertinoValue,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _cupertinoValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Text('AdaptiveSlider'),
                ),
                Container(
                  width: screenWidth * 0.92,
                  child: Slider.adaptive(
                    value: _adaptiveValue,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _adaptiveValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
