import 'package:flutter/material.dart';
import 'package:proximity/app/expansion_panel/expansion_panel_page.dart';

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
          _Card(
            page: ScrollbarPage(),
            title: 'Scrollbar',
            text: 'A Material Design scrollbar.',
            chipList: ['null safety', 'video', 'widget'],
          ),
          _Card(
            page: ExpansionPanelPage(),
            title: 'ExpansionPanel',
            text: 'A material expansion panel.',
            chipList: ['null safety', 'video', 'widget'],
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key key, this.page, this.title, this.text, this.chipList})
      : super(key: key);

  final Widget page;
  final String title;
  final String text;
  final List<String> chipList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(title),
              subtitle: Text(text),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                for (int i = 0; i < chipList.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Chip(
                      elevation: 2,
                      label: Text(chipList[i]),
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
