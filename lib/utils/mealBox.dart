import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MealBox extends StatefulWidget {
  const MealBox({super.key});
  
  
  
  @override
  State<MealBox> createState() => _MealBoxState();
}

class _MealBoxState extends State<MealBox> {

  List _items = [];

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('assets/json/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["Corn"];
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final double cardHeight = 250;
    readJson();
    
    return GestureDetector(

      onTap: (){},
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          height: cardHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color:Colors.black,
              width: 2
            )
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(_items[0]["color"]),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(_items[0]["color"]),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(_items[3]["name"]),
              )
        
            ],
          ),
        
        ),
      ),
    );
  }
}
