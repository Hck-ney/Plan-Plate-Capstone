import 'package:flutter/material.dart';
import 'package:flutter_2/utils/appBar.dart';

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
      body: Text("This is Cook Book page"),
    );
  }
}
