import 'package:flutter/material.dart';
import 'package:flutter_2/utils/appBar.dart';
import 'package:flutter_2/utils/recipeBox.dart';

class CookBook extends StatefulWidget {
  const CookBook({super.key});

  @override
  State<CookBook> createState() => _CookBookState();
}

class _CookBookState extends State<CookBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      endDrawer: CustomEndDrawer(),
      body: Column(
        children: [
          RecipeBox()
        ],
      ),
    );
  }
}
