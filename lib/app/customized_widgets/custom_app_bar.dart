import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String documentUrl;
  final String videoUrl;
  final AppBar appBar = AppBar();

  CustomAppBar({
    required this.title,
    required this.documentUrl,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
            icon: Icon(
              FontAwesomeIcons.youtube,
              color: Colors.red,
            ),
            onPressed: () {
              // _launchURL(videoUrl);
            }),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.bookOpen,
          ),
          onPressed: () {
            // _launchURL(documentUrl);
          },
        ),
      ],
    );
  }

  // void _launchURL(String _url) async => await canLaunch(_url)
  //     ? await launch(_url)
  //     : throw 'Could not launch $_url';

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
