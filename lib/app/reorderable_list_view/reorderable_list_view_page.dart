import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/custom_app_bar.dart';

class ReorderableListViewPage extends StatefulWidget {
  @override
  _ReorderableListViewPageState createState() =>
      _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  final List<int> _items = List<int>.generate(50, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ReorderableListView',
        documentUrl:
            'https://api.flutter.dev/flutter/material/ReorderableListView-class.html',
        videoUrl: 'https://youtu.be/3fB1mxOsqJE',
      ),
      body: Scrollbar(
        child: ReorderableListView(
          padding: const EdgeInsets.all(40),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
          children: <Widget>[
            for (int index = 0; index < _items.length; index++)
              ListTile(
                key: Key('$index'),
                tileColor:
                    _items[index].isOdd ? Color(0xFF02569B) : Color(0xFF0175C2),
                title: Text('Item ${_items[index]}'),
                trailing: Icon(Icons.drag_handle),
              ),
          ],
        ),
      ),
    );
  }
}
