import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliverAppBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              stretch: true,
              title: Text('Sliver'),
              stretchTriggerOffset: 150,
              onStretchTrigger: () async {
                print('on Stretch Triggers');
                return;
              },
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
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('SliverAppBar'),
                  background: Image.network(
                    'https://images.unsplash.com/photo-1618764117597-0626010bf40f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3589&q=80',
                    fit: BoxFit.cover,
                  ),
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                color: Colors.teal,
                child: Center(
                  child: Text('Proximity'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                color: Colors.amber,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                color: Colors.teal,
              ),
            ),
          ],
        )
    );
  }

  final _documentUrl =
      'https://flutter.dev/docs/development/ui/advanced/slivers';

  final _videoUrl = 'https://www.youtube.com/watch?v=mSc7qFzxHDw';

  // void _launchURL(String _url) async => await canLaunch(_url)
  //     ? await launch(_url)
  //     : throw 'Could not launch $_url';
}
