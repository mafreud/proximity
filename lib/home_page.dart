import 'package:flutter/material.dart';

import 'app/scrollbar/scrollbar_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('proximity'),
      ),
      body: Column(
        children: [
          _Card(),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScrollbarPage(),
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Scrollbar'),
              subtitle: Text('A Material Design scrollbar.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Chip(
                  elevation: 2,
                  label: Text('null safety'),
                ),
                const SizedBox(width: 8),
                Chip(
                  elevation: 2,
                  label: Text('video'),
                ),
                const SizedBox(width: 8),
                Chip(
                  elevation: 2,
                  label: Text('widget'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
