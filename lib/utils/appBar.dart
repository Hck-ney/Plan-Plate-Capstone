import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/pages/MealCalendar.dart';
import 'package:flutter_2/pages/cookbook.dart';
import 'package:flutter_2/pages/inventory.dart';
import 'package:flutter_2/pages/planner.dart';
import 'package:flutter_2/pages/shoppinglist.dart';
import 'package:flutter_2/func/logout.dart';
import 'DateTime.dart';

AppBar customAppBar() {
  return AppBar(
    title: Date.getTime(),
    actions: <Widget>[
      Builder(
        // Wrap your IconButton with a Builder
        builder: (BuildContext innerContext) {
          return IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Scaffold.of(innerContext).openEndDrawer(); // Use the innerContext
            },
          );
        },
      ),
    ],
  );
}

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({super.key});

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                spacing: 12,
                children: [
                  Text(
                    "${user?.email}",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.blue),
                      minimumSize: Size(250, 40)
                    ),
                      onPressed: () {
                        logoutUser();
                      }
                      ,
                      child: Text(
                        "Log Out",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              )),
          ListTile(
            leading: ImageIcon(
              AssetImage('assets/navBar/meal.png'),
            ),
            title: Text('Meal Calendar'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MealCalendar()));
            },
          ),
          ListTile(
            leading: ImageIcon(
              AssetImage('assets/navBar/calendar.png'),
            ),
            title: Text('Planner'),
            onTap: () {
              // Handle about action
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Planner()));
            },
          ),
          ListTile(
            leading: ImageIcon(
              AssetImage('assets/navBar/cookbook.png'),
            ),
            title: Text('Cook Book'),
            onTap: () {
              // Handle about action
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const CookBook()));
            },
          ),
          ListTile(
            leading: ImageIcon(
              AssetImage('assets/navBar/inventory.png'),
            ),
            title: Text('Inventory'),
            onTap: () {
              // Handle about action
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Inventory()));
            },
          ),
          ListTile(
            leading: ImageIcon(
              AssetImage('assets/navBar/shopping-cart.png'),
            ),
            title: Text('Shopping List'),
            onTap: () {
              // Handle about action
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const ShoppingList()));
            },
          ),
        ],
      ),
    );
  }
}
