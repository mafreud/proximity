import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../algolia/algolia_page.dart';
import '../algolia/algolia_search_index.dart';
import '../customized_widgets/list_tile_card.dart';
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
        body: Scrollbar(
          child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final widgetData = dataList[index];
                if (widgetData.name == 'Algolia' && Platform.isAndroid) {
                  return SizedBox();
                }
                return ListTileCard(
                  page: AlgoliaSearchIndex.retrieveWidget(widgetData.name),
                  title: widgetData.name,
                  text: widgetData.description,
                  chipList: widgetData.tag,
                  gif: widgetData.gif,
                );
              }),
        ));
  }
}
