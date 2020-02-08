import 'package:atb_hackathon/src/widgets/bank_card/bank_card_slider.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;



class CreditCardScreen extends StatelessWidget {

  void _scan() async {
    String cameraScanResult = await scanner.scan();
    // TODO: go to payment page
    print(cameraScanResult);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(100, 10, 250, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          elevation: 0,
          title: new Center(child: new Text('Pay', textAlign: TextAlign.center))
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SwitchListTile(
              value: true,
              onChanged: (value) { print(value); },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
              secondary: const Icon(Icons.work),
              title: const Text('Business'),
            ),
            // Container(height: constraints.biggest.height * 0.25, child: BankCardServicesSlider()),
            Container(height: constraints.biggest.height * 0.75, child: BankCardSliderWidget()),
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
