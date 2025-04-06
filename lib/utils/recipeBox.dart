import 'package:flutter/material.dart';

class RecipeBox extends StatelessWidget {
  const RecipeBox({super.key});

  @override
  Widget build(BuildContext context) {
    const boxHeight = 200.0;
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: NetworkImage('https://www.rollingstone.com/wp-content/uploads/2020/12/Hayley-Williams-Press-Image-8-PC_-Lindsey-Byrnes.jpg?w=1581&h=1054&crop=1'),
            child: InkWell(
              onTap: () {},
            ),
            height: 240,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8,)
        ],
      ),
    );
  }
}
