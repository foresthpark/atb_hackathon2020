import 'package:atb_hackathon/models/MerchantItem.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProductDetailPage extends StatelessWidget {
  final MerchantItem item;

  ProductDetailPage({MerchantItem this.item});

  @override
  Widget build(BuildContext context) {
    final MerchantItem item = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width * 0.8,
            height: height * 0.4,
            child: Container(
                child: Image.asset(
              'assets/items/${item.image_url}',
              fit: BoxFit.cover,
            )),
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
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                item.name,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '\$' + item.price.toString(),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: QrImage(
//              embeddedImage: NetworkImage(
//                  "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fn7.alamy.com%2Fzooms%2Fb1ce2246a8b541ba977b986fd627353e%2Frobot-face-icon-smiling-face-showing-tongue-emotion-robotic-emoji-jhtrd2.jpg&f=1&nofb=1"),
              data: item.price.toString(),
              version: QrVersions.auto,
              size: 180.0,
            ),
          ),
        ],
      ),
    );
  }
}
