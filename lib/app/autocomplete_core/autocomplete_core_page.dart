import 'package:flutter/material.dart';
import 'package:proximity/app/autocomplete_core/name_list.dart';

class AutocompleteCorePage extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutocompleteCore'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Form with Autocomplete'),
            Align(
              alignment: Alignment(0.0, -0.75),
              child: AutocompleteSample(),
            )
          ],
        ),
      ),
    );
  }
}

class AutocompleteSample extends StatelessWidget {
  final List<String> _kOptions = AutocompleteSampleNames().nameList;

  AutocompleteSample() {
    _kOptions.sort();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option
              .toLowerCase()
              .startsWith(textEditingValue.text.toLowerCase());
        }).toList();
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration:
              InputDecoration(hintText: 'Input query here "a" to "e"...'),
        );
      },
    );
  }
}
