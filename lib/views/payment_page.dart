import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: false,
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
                children: <Widget>[
                  swipeBar(),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'QR code',
                      style: TextStyle(fontSize: 20)
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Tap',
                      style: TextStyle(fontSize: 20)
                    ),
                  ),

                ]
                ))
        );
  }
}

Widget swipeBar() {
  return Swiper(
    layout: SwiperLayout.CUSTOM,
    customLayoutOption: new CustomLayoutOption(
        startIndex: 0,
        stateCount: 3
    ).addRotate([
      -45.0/180,
      0.0,
      45.0/180
    ]).addTranslate([
      new Offset(-370.0, -40.0),
      new Offset(0.0, 0.0),
      new Offset(370.0, -40.0)
    ]),
    itemWidth: 300.0,
    itemHeight: 200.0,
    itemBuilder: (context, index) {
      return new Container(
        decoration: myBoxDecoration(),
        child: new Center(
          child: new Text("$index"),
        ),
      );
    },
    itemCount: 3);
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(15.0)
  );
}

Widget test() {
  return Text('Test works');
}
