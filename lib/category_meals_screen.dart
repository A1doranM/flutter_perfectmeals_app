import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';
//  final String categoryId;
//  final String categoryTitle;
//
//  CategoryMealsScreen(
//      {@required this.categoryId, @required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: const Text('The Recipies For The Caegory!'),
      ),
    );
  }
}
