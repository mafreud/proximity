import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:proximity/app/customized_widgets/list_tile_card.dart';
import 'package:proximity/app/customized_widgets/widget_model.dart';
import 'package:proximity/app/indexed_stack/indexed_stack_page.dart';
import 'package:proximity/app/search_delegate/search_delegate_page.dart';
import 'package:proximity/app/sliver/sliver_app_bar_page.dart';
import 'package:proximity/app/sliver/sliver_list_and_sliver_grid_view_page.dart';
import 'package:proximity/app/sliver/sliver_page.dart';
import 'package:proximity/app/switch_list_tile/switch_list_tile_page.dart';
import 'package:proximity/app/table/table_page.dart';

import '../animated_switcher/animated_switcher.dart';
import '../expansion_panel/expansion_panel_page.dart';
import '../physical_model/physical_model.dart';
import '../rotated_box/rotated_box.dart';
import '../scrollbar/scrollbar_page.dart';
import 'algolia_service.dart';

class AlgoliaPage extends StatefulWidget {
  @override
  _AlgoliaPageState createState() => _AlgoliaPageState();
}

class _AlgoliaPageState extends State<AlgoliaPage> {
  final TextEditingController _controller = TextEditingController();

  List<AlgoliaObjectSnapshot> _results = [];

  bool _searching = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _search(text: _controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algolia Search'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Search'),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Search query here...'),
            ),
            SizedBox(height: 10),
            Expanded(
              child: _searching == true
                  ? Center(
                      child: Text('Searching, please wait...'),
                    )
                  : _results.isEmpty
                      ? Center(
                          child: Text('No results found.'),
                        )
                      : ListView.builder(
                          itemCount: _results.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            var snap = _results[index];
                            final data = snap.data;
                            final widget = WidgetModel.fromMap(data);
                            final page = retrieveWidget(widget.name);

                            return ListTileCard(
                              page: page,
                              title: widget.name,
                              text: widget.description,
                              chipList: widget.tag,
                              gif: widget.gif,
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _search({required String text}) async {
    setState(() {
      _searching = true;
    });

    final algolia = AlgoliaService.init();

    AlgoliaQuery query = algolia.instance.index('prod_PROXIMITY');
    query = query.query(text);

    _results = (await query.getObjects()).hits;

    setState(() {
      _searching = false;
    });
  }

  Widget retrieveWidget(String widgetName) {
    switch (widgetName) {
      case 'IndexedStack':
        {
          return IndexedStackPage();
        }
      case 'Sliver':
        {
          return SliverPage();
        }
      case 'SliverAppBar':
        {
          return SliverAppBarPage();
        }
      case 'SliverListAndSliverGridView':
        {
          return SliverListAndSliverGridViewPage();
        }
      case 'Algolia':
        {
          return AlgoliaPage();
        }
      case 'Search':
        {
          return SearchDelegatePage();
        }
      case 'Table':
        {
          return TablePage();
        }
      case 'SwitchListTile':
        {
          return SwitchListTilePage();
        }
      case 'AnimatedSwitcher':
        {
          return AnimatedSwitcherPage();
        }

      case 'RotatedBox':
        {
          return RotatedBoxPage();
        }
      case 'Scrollbar':
        {
          return ScrollbarPage();
        }
      case 'ExpansionPanel':
        {
          return ExpansionPanelPage();
        }
      case 'PhysicalModel':
        {
          return PhysicalModelPage();
        }
      default:
        return AlgoliaPage();
    }
  }
}
