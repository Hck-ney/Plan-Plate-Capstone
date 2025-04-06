import 'package:flutter/material.dart';
import 'package:flutter_2/utils/appBar.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      endDrawer: CustomEndDrawer(),
      body: Text("This is Shopping List page"),
    );
  }
}
