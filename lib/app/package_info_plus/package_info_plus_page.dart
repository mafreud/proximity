import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:proximity/constants/proximity_colors.dart';

import '../customized_widgets/custom_app_bar.dart';

class PackageInfoPlusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'PackageInfoPlus',
        documentUrl:
            'https://plus.fluttercommunity.dev/docs/package_info_plus/usage',
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: ProximityColors.flutterBlue),
          onPressed: () async {
            await _showDialog(context, await PackageInfo.fromPlatform());
          },
          child: Text('Get Package Infomation'),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, PackageInfo info) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Package Info Plus'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('buildNumber ${info.buildNumber}'),
                Text('packageName: ${info.packageName}'),
                Text('version: ${info.version}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
