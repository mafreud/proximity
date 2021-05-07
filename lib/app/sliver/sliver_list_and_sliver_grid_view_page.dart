import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliverListAndSliverGridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SliverListAndSliverGridView'),
          actions: [
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                ),
                onPressed: () {
                  // _launchURL(_videoUrl);
                }),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.bookOpen,
              ),
              onPressed: () {
                // _launchURL(_documentUrl);
              },
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Center(
                    child: Text('Grid $index'),
                  );
                },
                childCount: 20,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                        title: Text(
                          'List $index',
                        ),
                      ),
                  childCount: 20),
            ),
          ],
        ));
  }

  final _documentUrl =
      'https://flutter.dev/docs/development/ui/advanced/slivers';
  final _videoUrl = 'https://www.youtube.com/watch?v=ORiTTaVY6mM';

  // void _launchURL(String _url) async => await canLaunch(_url)
  //     ? await launch(_url)
  //     : throw 'Could not launch $_url';
}
