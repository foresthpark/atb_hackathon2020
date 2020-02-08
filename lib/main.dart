import 'package:atb_hackathon/views/homepage.dart';
import 'package:atb_hackathon/views/tab_page.dart';
import 'package:atb_hackathon/views/payment_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
  }
}
