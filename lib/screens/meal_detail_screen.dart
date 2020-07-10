import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: Center(
        child: Text('The meal - $mealId!'),
      ),
    );
  }
}
