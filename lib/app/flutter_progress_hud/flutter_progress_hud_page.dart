import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class FlutterProgressHudPage extends StatelessWidget {
  const FlutterProgressHudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ShowModalBottomSheet',
        documentUrl: 'https://pub.dev/packages/flutter_progress_hud',
        isVideoAvailable: false,
      ),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ProximityColors.secondaryBlue),
                  onPressed: () {
                    final progress = ProgressHUD.of(context);
                    progress!.show();
                    Future.delayed(Duration(seconds: 1), () {
                      progress.dismiss();
                    });
                  },
                  child: Text('Show for a second'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ProximityColors.secondaryBlue),
                  onPressed: () {
                    final progress = ProgressHUD.of(context);
                    progress!.showWithText('Loading...');
                    Future.delayed(Duration(seconds: 1), () {
                      progress.dismiss();
                    });
                  },
                  child: Text('Show with text'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
