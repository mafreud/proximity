import 'package:flutter/material.dart';

class SearchDelegatePage extends StatefulWidget {
  final List<String> list = List.generate(100, (index) => 'Text $index');
  @override
  _SearchDelegatePageState createState() => _SearchDelegatePageState();
}

class _SearchDelegatePageState extends State<SearchDelegatePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('proximity'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(widget.list),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'type "Text n" \nat search bar on appbar \ne.g) Text 10',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth / 15,
              ),
            ),
            SizedBox(
              height: screenWidth / 15,
            ),
            ElevatedButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: Search(widget.list),
                );
              },
              child: Text('Search'),
            )
          ],
        ),
      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String? selectedResult;
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult!),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ['Text 1', 'Text 2'];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(
            listExample.where(
              (element) => element.contains(query),
            ),
          );
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
