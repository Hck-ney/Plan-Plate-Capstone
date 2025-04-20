import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/login.dart';
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
  bool _customIcon = false;

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
                          minimumSize: Size(250, 40)),
                      onPressed: () {
                        logoutUser();
                      },
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
          ExpansionTile(
            title: Text('Groups'),
            onExpansionChanged: (bool expanded) {},
            controlAffinity: ListTileControlAffinity.leading,
            children: const <Widget>[
              ListTile(
                title: Text('Group 1'),
              ),
              ListTile(
                title: Text('Join Group'),
                leading: Icon(Icons.accessibility),
              ),
              ListTile(
                title: Text('Create Group'),
                leading: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }

  void logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
      // Navigate to login screen or do something else
    } catch (e) {}
  }
}

class BasicTile {
  final String title;
  final List<BasicTile> tiles;

  const BasicTile({required this.title, this.tiles = const []});
}

final basicTiles = <BasicTile>[
  const BasicTile(
      title: 'Fruits',
      tiles: [BasicTile(title: 'title'), BasicTile(title: 'title')])
];

Widget buildTile(BasicTile tile) {
  return ExpansionTile(title: Text('data'));
}
