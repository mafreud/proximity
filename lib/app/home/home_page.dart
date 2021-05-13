import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proximity/app/align/align_page.dart';

import '../algolia/algolia_page.dart';
import '../animated_switcher/animated_switcher.dart';
import '../customized_widgets/list_tile_card.dart';
import '../expansion_panel/expansion_panel_page.dart';
import '../fractionally_sized_box/fractionally_sized_box.dart';
import '../indexed_stack/indexed_stack_page.dart';
import '../physical_model/physical_model.dart';
import '../rotated_box/rotated_box.dart';
import '../scrollbar/scrollbar_page.dart';
import '../search_delegate/search_delegate_page.dart';
import '../sliver/sliver_page.dart';
import '../switch_list_tile/switch_list_tile_page.dart';
import '../table/table_page.dart';
import '../welcome/welcome_page.dart';
import 'home_view_model.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(homeViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('proximity'),
        leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await viewModel.logout();
              await await Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            }),
        actions: [
          Platform.isIOS
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AlgoliaPage()));
                  },
                )
              : SizedBox(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTileCard(
              page: AlignPage(),
              title: 'Align',
              text:
                  'A widget that aligns its child within itself and optionally sizes itself based on the child\'s size.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/align.gif',
            ),
            ListTileCard(
              page: FractionallySizedBoxPage(),
              title: 'FractionallySizedBox',
              text:
                  'A widget that sizes its child to a fraction of the total available space.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/fractionally_sized_box.gif',
            ),
            ListTileCard(
              page: IndexedStackPage(),
              title: 'IndexedStack',
              text:
                  'A Stack that shows a single child from a list of children.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/indexed_stack.gif',
            ),
            ListTileCard(
              page: SliverPage(),
              title: 'Sliver',
              text:
                  'A sliver is a portion of a scrollable area that you can define to behave in a special way.',
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
