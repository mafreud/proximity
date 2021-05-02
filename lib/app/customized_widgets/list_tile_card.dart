import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({
    required this.page,
    required this.title,
    required this.text,
    required this.chipList,
    required this.gif,
  });

  final Widget? page;
  final String? title;
  final String? text;
  final List<String>? chipList;
  final String? gif;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page!,
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              minVerticalPadding: 10,
              leading: Image.asset(gif!),
              title: Text(title!),
              subtitle: Text(text!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                for (int i = 0; i < chipList!.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Chip(
                      elevation: 2,
                      label: Text(chipList![i]),
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
