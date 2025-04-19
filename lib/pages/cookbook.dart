import 'package:flutter/material.dart';
import 'package:flutter_2/firestore.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height, // or some fixed height
              child: ItemList(),
            ),
          ],
        ),
      ),
    );
  }
}
