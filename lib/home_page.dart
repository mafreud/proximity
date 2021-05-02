import 'package:flutter/material.dart';
import 'package:proximity/app/animated_switcher/animated_switcher.dart';
import 'package:proximity/app/expansion_panel/expansion_panel_page.dart';
import 'package:proximity/app/physical_model/physical_model.dart';
import 'package:proximity/app/rotated_box/rotated_box.dart';
import 'package:proximity/app/sliver/sliver_app_bar_page.dart';
import 'package:proximity/app/sliver/sliver_list_and_sliver_gridview_page.dart';
import 'app/scrollbar/scrollbar_page.dart';
import 'app/search_delegate/search_delegate_page.dart';
import 'app/switch_list_tile/switch_list_tile_page.dart';
import 'app/table/table_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('proximity'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Card(
              page: SliverAppBarPage(),
              title: 'SliverAppBar',
              text:
              'A sliver is a portion of a scrollable area that you can define to behave in a special way.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/sliver.gif',
            ),
            _Card(
              page: SliverListAndSliverGridViewPage(),
              title: 'SliverListAndSliverGridView',
              text:
              'A sliver is a portion of a scrollable area that you can define to behave in a special way.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/sliver.gif',
            ),
            _Card(
              page: SearchDelegatePage(),
              title: 'Search',
              text: 'Text search in Flutter',
              chipList: ['null safety', 'video'],
              gif: 'assets/gif/search_delegate.gif',
            ),
            _Card(
              page: TablePage(),
              title: 'Table',
              text:
                  'A widget that uses the table layout algorithm for its children.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/table.gif',
            ),
            _Card(
              page: SwitchListTilePage(),
              title: 'SwitchListTile',
              text:
                  'A ListTile with a Switch. In other words, a switch with a label.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/switch_list_tile.gif',
            ),
            _Card(
              page: AnimatedSwitcherPage(),
              title: 'AnimatedSwitcher',
              text: 'Animated cross-fade between 2 widgets.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/animated_switcher.gif',
            ),
            _Card(
              page: RotatedBoxPage(),
              title: 'RotatedBox',
              text:
                  'A widget that rotates its child by a integral number of quarter turns.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/rotated_box.gif',
            ),
            _Card(
              page: ScrollbarPage(),
              title: 'Scrollbar',
              text: 'A Material Design scrollbar.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/scrollbar.gif',
            ),
            _Card(
              page: ExpansionPanelPage(),
              title: 'ExpansionPanel',
              text: 'A material expansion panel.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/expansion_panel.gif',
            ),
            _Card(
              page: PhysicalModelPage(),
              title: 'PhysicalModel',
              text:
                  'A widget representing a physical layer that clips its children to a shape.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/animated_physical_model.gif',
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    this.page,
    this.title,
    this.text,
    this.chipList,
    this.gif,
  }) : super(key: key);

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
