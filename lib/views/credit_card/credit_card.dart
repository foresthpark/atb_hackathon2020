import 'package:atb_hackathon/models/QRData.dart';
import 'package:atb_hackathon/src/widgets/bank_card/bank_card_slider.dart';
import 'package:atb_hackathon/views/credit_card/confirm_payment.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:convert';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  bool categoryValue = true;

  _scan() async {
    print("###############################");
    String cameraScanResult = await scanner.scan();
    print(cameraScanResult);
//    var infoJson = json.encode(cameraScanResult);
    var decoded = json.decode(cameraScanResult);
    print(decoded);

//    var map = Map.fromIterable(decoded,
//        key: (e) => e.keys.first, value: (e) => e.values.first);
//    var paymentInfo = QRData.fromJson(infoJson);
//    print(map);
//    print(paymentInfo.name);
    print('hello');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPaymentScreen(),
          settings: RouteSettings(arguments: decoded),
        ));
  }

  void toggleCategoryButton() {
    setState(() {
      categoryValue = !categoryValue;
    });
    print(categoryValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SwitchListTile(
                    value: categoryValue,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        toggleCategoryButton();
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                    secondary: categoryValue
                        ? Icon(Icons.work, color: Colors.black)
                        : Icon(Icons.account_circle, color: Colors.black),
                    title: categoryValue
                        ? Text(
                            'Business',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )
                        : Text(
                            'Personal',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                  ),
                  Container(
                      height: constraints.biggest.height * 0.75,
                      child: BankCardSliderWidget()),
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      color: Colors.white,
                      onPressed: _scan,
                    ),
                  ),
                ]);
          }),
        ));
  }
}
