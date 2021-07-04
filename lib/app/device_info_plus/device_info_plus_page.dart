import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';
import 'package:proximity/constants/proximity_colors.dart';

class DeviceInfoPlusPage extends StatelessWidget {
  const DeviceInfoPlusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'DeviceInfoPlus',
        documentUrl:
            'https://plus.fluttercommunity.dev/docs/device_info_plus/usage',
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: ProximityColors.flutterBlue),
          onPressed: () async {
            final deviceInfo = DeviceInfoPlugin();
            if (Platform.isAndroid) {
              await _showDialogForAndroid(
                  context, await deviceInfo.androidInfo);
            }
            if (Platform.isIOS) {
              await _showDialogForIos(context, await deviceInfo.iosInfo);
            }
          },
          child: Text('Get Device Infomation'),
        ),
      ),
    );
  }

  Future<void> _showDialogForAndroid(
      BuildContext context, AndroidDeviceInfo info) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Device Info Plus'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('brand: ${info.brand}'),
                Text('isPhysicalDevice? ${info.isPhysicalDevice}'),
                Text('manufacturer: ${info.manufacturer}'),
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

  Future<void> _showDialogForIos(
      BuildContext context, IosDeviceInfo info) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Device Info Plus'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('isPhysicalDevice? ${info.isPhysicalDevice}'),
                Text('Device Name: ${info.name}'),
                Text('systemName: ${info.systemName}'),
                Text('systemVersion: ${info.systemVersion}'),
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
