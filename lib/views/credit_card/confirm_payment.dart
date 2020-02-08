import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(100, 10, 250, 1),
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            elevation: 0,
            title: const Text('Confirm payment')),
        body: Container(
            child: Column(children: [
          Text(
            "Send",
            style: Theme.of(context).textTheme.display2,
          ),
          Text(
            "\$32.73 CAD",
            style: Theme.of(context).textTheme.display3,
          ),
          Text(
            "John Doe",
            style: Theme.of(context).textTheme.display1,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: ConfirmationSlider(
                  onConfirmation: () {
                    print("confirmed!");
                  },
                )),
          )
        ])));
  }
}
