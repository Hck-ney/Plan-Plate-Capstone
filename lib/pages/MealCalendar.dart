import 'package:flutter/material.dart';
import 'package:flutter_2/utils/appBar.dart';
import 'package:flutter_2/utils/mealBox.dart';

class MealCalendar extends StatefulWidget {
  const MealCalendar({super.key});

  @override
  State<MealCalendar> createState() => _MealCalendarState();
}

class _MealCalendarState extends State<MealCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      endDrawer: CustomEndDrawer(),
      body: Text("This is Meal Calendar Page"),
    );
  }
}
