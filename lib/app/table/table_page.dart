import 'package:flutter/material.dart';

import '../customized_widgets/custom_app_bar.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Table',
        documentUrl: 'https://api.flutter.dev/flutter/widgets/Table-class.html',
        videoUrl: 'https://youtu.be/_lbE0wsVZSw',
      ),
      body: Center(
        child: Table(
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                _Container(
                  color: _switch ? Colors.transparent : Colors.teal,
                ),
                _Container(),
                _Container(
                  color: _switch ? Colors.pink : Colors.transparent,
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                _Container(),
                _Container(
                  color: _switch ? Colors.pink : Colors.teal,
                ),
                _Container(),
              ],
            ),
            TableRow(
              children: <Widget>[
                _Container(
                  color: _switch ? Colors.pink : Colors.transparent,
                ),
                _Container(),
                _Container(
                  color: _switch ? Colors.transparent : Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Switch'),
        onPressed: () {
          setState(() {
            _switch = !_switch;
          });
        },
      ),
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: screenWidth / 4,
        width: screenWidth / 4,
        color: color,
      ),
    );
  }
}
