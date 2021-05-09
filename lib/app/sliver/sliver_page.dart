import 'package:flutter/material.dart';
import '../customized_widgets/list_tile_card.dart';
import 'sliver_app_bar_page.dart';
import 'sliver_list_and_sliver_grid_view_page.dart';

class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTileCard(
              page: SliverAppBarPage(),
              title: 'SliverAppBar',
              text:
                  'A material design app bar that integrates with a CustomScrollView.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/sliver_app_bar.gif',
            ),
            ListTileCard(
              page: SliverListAndSliverGridViewPage(),
              title: 'SliverListAndSliverGridView',
              text:
                  'A sliver that places multiple box children in a two dimensional arrangement. A sliver that places multiple box children in a linear array along the main axis.',
              chipList: ['null safety', 'video', 'widget'],
              gif: 'assets/gif/sliver_list_and_sliver_grid_view.gif',
            ),
          ],
        ),
      ),
    );
  }
}
