class MerchantItem {
  String image_url;
  String name;
  double price;

  MerchantItem({this.image_url, this.name, this.price});

  factory MerchantItem.fromJson(Map<String, dynamic> json) {
    return MerchantItem(
      image_url: json['image_url'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.image_url;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

List<MerchantItem> listOfMerchantItems = [
  MerchantItem(
      name: "Yoda Doll",
      price: 109.00,
      image_url:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ebayimg.com%2Fimages%2Fi%2F171632740553-0-1%2Fs-l1000.jpg&f=1&nofb=1"),
  MerchantItem(
      name: "Yoda Doll",
      price: 109.00,
      image_url:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ebayimg.com%2Fimages%2Fi%2F171632740553-0-1%2Fs-l1000.jpg&f=1&nofb=1"),
  MerchantItem(
      name: "Yoda Doll",
      price: 109.00,
      image_url:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ebayimg.com%2Fimages%2Fi%2F171632740553-0-1%2Fs-l1000.jpg&f=1&nofb=1"),
  MerchantItem(
      name: "Yoda Doll",
      price: 109.00,
      image_url:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ebayimg.com%2Fimages%2Fi%2F171632740553-0-1%2Fs-l1000.jpg&f=1&nofb=1"),
  MerchantItem(
      name: "Yoda Doll",
      price: 109.00,
      image_url:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ebayimg.com%2Fimages%2Fi%2F171632740553-0-1%2Fs-l1000.jpg&f=1&nofb=1"),
  MerchantItem(
      name: "Yoda Doll",
      price: 109.00,
      image_url:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ebayimg.com%2Fimages%2Fi%2F171632740553-0-1%2Fs-l1000.jpg&f=1&nofb=1"),
  MerchantItem(
      name: "Yoda Doll",
      price: 109.00,
      image_url:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ebayimg.com%2Fimages%2Fi%2F171632740553-0-1%2Fs-l1000.jpg&f=1&nofb=1"),
  MerchantItem(
      name: "Yoda Doll",
      price: 109.00,
      image_url:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ebayimg.com%2Fimages%2Fi%2F171632740553-0-1%2Fs-l1000.jpg&f=1&nofb=1"),
];

List getMerchantItems() {
  return listOfMerchantItems;
}
