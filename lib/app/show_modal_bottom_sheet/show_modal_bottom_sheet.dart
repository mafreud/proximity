import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class ShowModalBottomSheetPage extends StatefulWidget {
  @override
  _ShowModalBottomSheetPageState createState() =>
      _ShowModalBottomSheetPageState();
}

class _ShowModalBottomSheetPageState extends State<ShowModalBottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'ShowModalBottomSheet',
          documentUrl:
              'https://api.flutter.dev/flutter/material/showModalBottomSheet.html',
          isVideoAvailable: false,
        ),
        body: Center(
          child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(primary: ProximityColors.primaryBlue),
            onPressed: () {
              buildShowModalBottomSheet(context);
            },
            child: Text('show'),
          ),
        ));
  }

  Future<void> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: ProximityColors.googleGray,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ProximityColors.flutterBlue),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('close'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
