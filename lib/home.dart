import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeState extends StatefulWidget {
  const HomeState({super.key});

  @override
  State<HomeState> createState() => _HomeState();
}

class _HomeState extends State<HomeState> {
  int _selectedIndex = 0;
  String title = 'Today';

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Text getTime(){
    return Text("Today, ${DateFormat('MMMM d').format(DateTime.now())}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: getTime(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle), // Change the icon here
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              Text("data")
            ],
          ),
        ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/navBar/meal.png')),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/navBar/calendar.png')),
            label: 'Planner',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/navBar/cookbook.png')),
            label: 'Cook Book',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
