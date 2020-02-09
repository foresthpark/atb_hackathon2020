import 'package:atb_hackathon/src/widgets/bank_card/bank_card_slider.dart';
import 'package:atb_hackathon/views/credit_card/confirm_payment.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  bool categoryValue = true;

  _scan() async {
    String cameraScanResult = await scanner.scan();
    print("###############################");
    print(cameraScanResult);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmPaymentScreen(),
        settings: RouteSettings(arguments: cameraScanResult),
      ),
    );
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
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            elevation: 0,
            title: new Center(
                child: new Text('Pay', textAlign: TextAlign.center))),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  ? Icon(Icons.work, color: Colors.white)
                  : Icon(Icons.camera, color: Colors.white),
              title: categoryValue
                  ? Text(
                      'Business',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )
                  : Text(
                      'Personal',
                      style: TextStyle(
                          color: Colors.white,
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
        }));
  }
}
