import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Text(
                    "Plan your Plate",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Username",
                  textAlign: TextAlign.left,
                ),
              ),
              TextField(
                  controller: email,
                  decoration: InputDecoration(
                      //labelText: 'Username',
                      //icon: Icon(Icons.account_circle_outlined)),
                      )),
              SizedBox(height: 16.0),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    textAlign: TextAlign.left,
                  )),
              TextField(
                  controller: password,
                  decoration: InputDecoration(
                      //labelText: 'Password',
                      //icon: Icon(Icons.account_circle_outlined)),
                      )),
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: Align(
                  alignment: Alignment.centerRight, // Align to the right
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              //ElevatedButton(onPressed: (() => signIn()), child: Text("Login")),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (() => signIn()),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Text("or Sign Up Using"),
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 140),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/google.png',
                          width: 48,
                          height: 48,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/facebook.png',
                          width: 52,
                          height: 52,
                        )),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Don't have an account? Sign Up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
