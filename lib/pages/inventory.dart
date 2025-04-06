import 'package:flutter/material.dart';
import 'package:flutter_2/utils/appBar.dart';

class Inventory extends StatefulWidget {
  const Inventory ({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      endDrawer: CustomEndDrawer(),
      body: Text("This is Inventory page"),
    );
  }
}
