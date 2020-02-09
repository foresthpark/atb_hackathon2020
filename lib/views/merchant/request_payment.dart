import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RequestPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              child: BeautyTextfield(
                width: double.maxFinite, //REQUIRED
                height: 60, //REQUIRED
                accentColor: Colors.white, // On Focus Color
                textColor: Colors.black, //Text Color
                backgroundColor: Color(0xff71C5E8), //Not Focused Color
                textBaseline: TextBaseline.alphabetic,
                autocorrect: false,
                autofocus: false,
                enabled: true, // Textfield enabled
                focusNode: FocusNode(),
                fontFamily: 'Righteous', //Text Fontfamily
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                minLines: 1,
                maxLines: 2,
                wordSpacing: 2,
                margin: EdgeInsets.all(10),
                cornerRadius: BorderRadius.all(Radius.circular(15)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.text, //REQUIRED
                placeholder: "Item Name",
                isShadow: true,
                obscureText: false,
                prefixIcon: Icon(Icons.card_giftcard), //REQUIRED
//                suffixIcon: Icon(Icons.remove_red_eye),
                onClickSuffix: () {
                  print('Suffix Clicked');
                },
                onTap: () {
                  print('Click');
                },
                onChanged: (text) {
                  print(text);
                },
                onSubmitted: (data) {
                  print(data);
                  print(data.length);
                },
              ),

//        QrImage(
//          data: "1234567890",
//          version: QrVersions.auto,
//          size: 200.0,
//        ),
            ),
          ),
          Center(
            child: Container(
              child: BeautyTextfield(
                width: double.maxFinite, //REQUIRED
                height: 60, //REQUIRED
                accentColor: Colors.white, // On Focus Color
                textColor: Colors.black, //Text Color
                backgroundColor: Color(0xff71C5E8), //Not Focused Color
                textBaseline: TextBaseline.alphabetic,
                autocorrect: false,
                autofocus: false,
                enabled: true, // Textfield enabled
                focusNode: FocusNode(),
                fontFamily: 'Righteous', //Text Fontfamily
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
//          maxLength: 10,
                minLines: 1,
                maxLines: 2,
                wordSpacing: 2,
                margin: EdgeInsets.all(10),
                cornerRadius: BorderRadius.all(Radius.circular(15)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.text, //REQUIRED
                placeholder: "Input amount",
                isShadow: true,
                obscureText: false,
                prefixIcon: Icon(Icons.attach_money), //REQUIRED
//                suffixIcon: Icon(Icons.remove_red_eye),
                onClickSuffix: () {
                  print('Suffix Clicked');
                },
                onTap: () {
                  print('Click');
                },
                onChanged: (text) {
                  print(text);
                },
                onSubmitted: (data) {
                  print(data);
                  print(data.length);
                },
              ),

//        QrImage(
//          data: "1234567890",
//          version: QrVersions.auto,
//          size: 200.0,
//        ),
            ),
          )
        ],
      ),
    );
  }
}
