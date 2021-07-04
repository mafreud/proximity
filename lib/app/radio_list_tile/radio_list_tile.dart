import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../customized_widgets/custom_app_bar.dart';

class RadioListTilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'RadioListTile',
        documentUrl:
            'https://plus.fluttercommunity.dev/docs/package_info_plus/usage',
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {},
          child: Text('Get Package Infomation'),
        ),
      ),
    );
  }
}
