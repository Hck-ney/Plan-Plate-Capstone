import 'package:flutter/material.dart';
import 'package:flutter_2/home.dart';
import 'package:flutter_2/utils/appBar.dart';

class Planner extends StatefulWidget {
  const Planner({super.key});

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      endDrawer: CustomEndDrawer(),
      body: Text("This is Planner page"),
    );
  }
}

