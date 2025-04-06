import 'package:flutter/material.dart';

class RecipeBox extends StatelessWidget {
  const RecipeBox({super.key});

  @override
  Widget build(BuildContext context) {
    const boxHeight = 200.0;
    const radius = 24.0;
    return Card(
      margin: EdgeInsets.all(24.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              topLeft: Radius.circular(radius))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Ink.image(
                image: NetworkImage(
                    'https://www.rollingstone.com/wp-content/uploads/2020/12/Hayley-Williams-Press-Image-8-PC_-Lindsey-Byrnes.jpg?w=1581&h=1054&crop=1'),
                child: InkWell(
                  onTap: () {},
                ),
                height: 240,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hayley Williams",

                  style: TextStyle(
                    fontSize: 20,

                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
