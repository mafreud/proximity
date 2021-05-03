import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proximity/app/sliver/sliver_page.dart';
import 'app/sliver/sliver_list_and_sliver_grid_view_page.dart';
import 'app/sliver/sliver_app_bar_page.dart';
import 'app/algolia/algolia_page.dart';
import 'app/animated_switcher/animated_switcher.dart';
import 'app/customized_widgets/list_tile_card.dart';
import 'app/expansion_panel/expansion_panel_page.dart';
import 'app/physical_model/physical_model.dart';
import 'app/rotated_box/rotated_box.dart';
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
            ListTileCard(
              page: SliverPage(),
              title: 'Sliver',
              text: 'A sliver is a portion of a scrollable area that you can define to behave in a special way.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/sliver_app_bar.gif',
            ),
            Platform.isIOS
                ? ListTileCard(
                    page: AlgoliaPage(),
                    title: 'Algolia',
                    text: 'full-text search, typo tolerant',
                    chipList: ['null safety', 'plugin'],
                    gif: 'assets/gif/algolia.gif',
                  )
                : SizedBox(),
            ListTileCard(
              page: SearchDelegatePage(),
              title: 'Search',
              text: 'Text search in Flutter',
              chipList: ['null safety', 'video'],
              gif: 'assets/gif/search_delegate.gif',
            ),
            ListTileCard(
              page: TablePage(),
              title: 'Table',
              text:
                  'A widget that uses the table layout algorithm for its children.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/table.gif',
            ),
            ListTileCard(
              page: SwitchListTilePage(),
              title: 'SwitchListTile',
              text:
                  'A ListTile with a Switch. In other words, a switch with a label.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/switch_list_tile.gif',
            ),
            ListTileCard(
              page: AnimatedSwitcherPage(),
              title: 'AnimatedSwitcher',
              text: 'Animated cross-fade between 2 widgets.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/animated_switcher.gif',
            ),
            ListTileCard(
              page: RotatedBoxPage(),
              title: 'RotatedBox',
              text:
                  'A widget that rotates its child by a integral number of quarter turns.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/rotated_box.gif',
            ),
            ListTileCard(
              page: ScrollbarPage(),
              title: 'Scrollbar',
              text: 'A Material Design scrollbar.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/scrollbar.gif',
            ),
            ListTileCard(
              page: ExpansionPanelPage(),
              title: 'ExpansionPanel',
              text: 'A material expansion panel.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/expansion_panel.gif',
            ),
            ListTileCard(
              page: PhysicalModelPage(),
              title: 'PhysicalModel',
              text:
                  'A widget representing a physical layer that clips its children to a shape.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/physical_model.gif',
            ),
          ],
        ),
      ),
    );
  }
}
