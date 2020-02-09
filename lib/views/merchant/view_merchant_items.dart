import 'package:atb_hackathon/models/MerchantItem.dart';
import 'package:atb_hackathon/views/merchant/product_detail_p_age.dart';
import 'package:flutter/material.dart';

class ViewMerchantItems extends StatelessWidget {
  List<MerchantItem> merchantItems = [
    MerchantItem(name: "Red Tango Set", price: 209.00, image_url: "item1.jpeg"),
    MerchantItem(name: "Nike Dunks", price: 350.00, image_url: "item2.jpeg"),
    MerchantItem(
        name: "Organic Peanut Butter", price: 19.00, image_url: "item3.jpeg"),
    MerchantItem(
        name: "Hair Treatment Kit", price: 119.00, image_url: "item4.jpeg"),
    MerchantItem(
        name: "Lavender Hand Cream", price: 39.00, image_url: "item5.jpeg"),
    MerchantItem(
        name: "How not to give a f**k book",
        price: 18.00,
        image_url: "item6.jpeg"),
    MerchantItem(
        name: "Fresh Coffee Beans", price: 21.00, image_url: "item7.jpeg"),
    MerchantItem(
        name: "Magnum PI Sunglasses", price: 28.00, image_url: "item8.jpeg"),
    MerchantItem(
        name: "Love Potion No.8", price: 69.00, image_url: "item9.jpeg"),
    MerchantItem(
        name: "Sonos Speakers", price: 299.00, image_url: "item10.jpeg"),
    MerchantItem(name: "EarthPods", price: 329.00, image_url: "item11.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: merchantItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ProductDetailPage();
                },
                settings: RouteSettings(
                  arguments: merchantItems[index],
                ),
              ));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Image.asset(
                          'assets/items/${merchantItems[index].image_url}',
                          fit: BoxFit.cover,
                        ),
                        height: 130),
                  ),
                  Text(
                    merchantItems[index].name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text('\$' + merchantItems[index].price.toString()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
