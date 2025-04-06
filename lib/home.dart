import 'package:flutter/material.dart';
import 'pages/MealCalendar.dart';

class HomeState extends StatefulWidget {
  const HomeState({super.key});

  @override
  State<HomeState> createState() => _HomeState();
}

 class _HomeState extends State<HomeState> {
  String title = 'Today';



  @override
  Widget build(BuildContext context) {
    return MealCalendar();
  }}
