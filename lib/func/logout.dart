import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void logoutUser() async {
  try {
    await FirebaseAuth.instance.signOut();
    // Navigate to login screen or do something else
  } catch (e) {
  }
}