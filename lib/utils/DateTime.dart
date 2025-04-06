import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date {
  static Text getTime() {
    return Text("Today, ${DateFormat('MMMM d').format(DateTime.now())}");
  }
}

