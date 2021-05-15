import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';

import '../customized_widgets/list_tile_card.dart';
import '../customized_widgets/widget_model.dart';

import 'algolia_search_index.dart';
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
                            final page =
                                AlgoliaSearchIndex.retrieveWidget(widget.name);

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
}
