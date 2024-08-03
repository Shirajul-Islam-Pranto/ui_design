import 'package:flutter/material.dart';

class CategoryModel {
  String? photo, name;
  int? id;
  List<SubCategoryModel>? subCategories;

  CategoryModel({this.id, this.name, this.photo, this.subCategories});
}

class SubCategoryModel {
  String? photo, name;
  int? id;

  SubCategoryModel({this.id, this.name, this.photo});
}
