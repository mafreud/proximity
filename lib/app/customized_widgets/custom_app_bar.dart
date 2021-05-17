import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String documentUrl;
  final String videoUrl;
  final AppBar appBar = AppBar();
  final bool isVideoAvailable;

  CustomAppBar({
    required this.title,
    required this.documentUrl,
    this.videoUrl = '',
    this.isVideoAvailable = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        isVideoAvailable
            ? IconButton(
                icon: Icon(
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                ),
                onPressed: () {
                  _launchURL(videoUrl);
                })
            : SizedBox(),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.bookOpen,
          ),
          onPressed: () {
            _launchURL(documentUrl);
          },
        )
      ],
    );
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
