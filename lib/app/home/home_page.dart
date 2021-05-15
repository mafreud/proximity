import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proximity/app/algolia/algolia_search_index.dart';
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
  // final algoliaList = AlgoliaSearchIndex.fromMap(AlgoliaIndex.index);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(homeViewModelProvider);
    final algoliaDataList = AlgoliaIndex.index;
    final dataList =
        algoliaDataList.map((e) => AlgoliaSearchIndex.fromMap(e)).toList();

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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlgoliaPage()));
                    },
                  )
                : SizedBox(),
          ],
        ),
        // TODO(aoki): algoliaセクションはiosのみで表示
        body: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              final widgetData = dataList[index];
              return ListTileCard(
                page: AlgoliaSearchIndex.retrieveWidget(widgetData.name),
                title: widgetData.name,
                text: widgetData.description,
                chipList: widgetData.tag,
                gif: widgetData.gif,
              );
            }));
  }
}
