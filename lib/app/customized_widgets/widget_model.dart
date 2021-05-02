import 'dart:convert';

class WidgetModel {
  final String name;
  final String description;
  final List<String> tag;
  final String gif;

  WidgetModel(
    this.name,
    this.description,
    this.tag,
    this.gif,
  );

  WidgetModel copyWith({
    String? name,
    String? description,
    List<String>? tag,
    String? gif,
  }) {
    return WidgetModel(
      name ?? this.name,
      description ?? this.description,
      tag ?? this.tag,
      gif ?? this.gif,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'tag': tag,
      'gif': gif,
    };
  }

  factory WidgetModel.fromMap(Map<String, dynamic> map) {
    return WidgetModel(
      map['name'],
      map['description'],
      List<String>.from(map['tag']),
      map['gif'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WidgetModel.fromJson(String source) =>
      WidgetModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WidgetModel(name: $name, description: $description, tag: $tag, gif: $gif)';
  }
}
