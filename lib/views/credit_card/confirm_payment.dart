import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> infoJson =
        ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            elevation: 0,
            title: const Text('Confirm payment')),
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    print("shit was tapped");
                  },
                  child: Center(
                    child: Container(
                      width: width * 0.8,
                      height: height * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xff71C5E8),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 6.0,
                            color: Colors.white,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0.0, 3.0),
                                    blurRadius: 6.0,
                                    color: Colors.black38,
                                  ),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Image.asset(
                                'assets/items/${infoJson['image']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Paying: ${infoJson['vendor']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '\$' + infoJson['price'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'for:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              infoJson['name'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: ConfirmationSlider(
                    onConfirmation: () {
                      Navigator.pop(context);
                      print('Confirmed');
                    },
                  ),
                ),
              ),
            ])));
  }
}
