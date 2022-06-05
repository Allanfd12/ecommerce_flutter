import 'dart:convert';

import 'package:ecommerce_app/domain/entities/category.dart';

class CategoryModel extends Category {
  final int id;
  final String name;
  final String slug;

  CategoryModel(this.id, this.name, this.slug) : super(id, name, slug);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      map['id'],
      map['name'],
      map['slug'],
    );
  }

  String toJson() => json.encode(toMap());

  static CategoryModel fromJson(String source) {
    return fromMap(json.decode(source));
  }
}
