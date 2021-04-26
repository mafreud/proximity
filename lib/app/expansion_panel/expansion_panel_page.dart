import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Item {
  Item({
    @required this.expandedValue,
    @required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class ExpansionPanelPage extends StatefulWidget {
  @override
  _ExpansionPanelPageState createState() => _ExpansionPanelPageState();
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
              ),
              onPressed: () {
                _launchURL(_videoUrl);
              }),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bookOpen,
            ),
            onPressed: () {
              _launchURL(_documentUrl);
            },
          ),
        ],
        title: Text('ExpansionPanel'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _data[index].isExpanded = !isExpanded;
              });
            },
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                  );
                },
                body: ListTile(
                    title: Text(item.expandedValue),
                    subtitle: const Text(
                        'To delete this panel, tap the trash can icon'),
                    trailing: const Icon(Icons.delete),
                    onTap: () {
                      setState(() {
                        _data.removeWhere(
                            (Item currentItem) => item == currentItem);
                      });
                    }),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  final _documentUrl =
      'https://api.flutter.dev/flutter/material/ExpansionPanel-class.html';
  final _videoUrl = 'https://youtu.be/2aJZzRMziJc';

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
