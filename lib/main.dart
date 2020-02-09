import 'package:atb_hackathon/models/MerchantItem.dart';
import 'package:atb_hackathon/views/credit_card/credit_card.dart';
import 'package:atb_hackathon/views/merchant/view_merchant_items.dart';
import 'package:atb_hackathon/views/credit_card/confirm_payment.dart';
import 'package:atb_hackathon/views/intro_screen.dart';
import 'package:atb_hackathon/views/merchant/request_payment.dart';
import 'package:atb_hackathon/views/onboarding_start_screen.dart';
import 'package:atb_hackathon/views/pending_catgories.dart';
import 'package:atb_hackathon/views/tab_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: CreditCardScreen(),
      home: ViewMerchantItems(),
    );
  }
}
