import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomepageState extends StatefulWidget {
  const HomepageState({super.key});

  @override
  State<HomepageState> createState() => _HomepageStateState();
}

class _HomepageStateState extends State<HomepageState> {

  final user =FirebaseAuth.instance.currentUser;

  signOut()async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: AppBar(title: Text("Homepage"),),
      body: Center(
        child: Text('${user!.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=>signOut()),
        child: Icon(Icons.login_rounded),
      ),
    );*/
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${user!.email}"),),
      body: ElevatedButton(onPressed: (()=>signOut()), child: Text("Log Out")),
    );
  }
}