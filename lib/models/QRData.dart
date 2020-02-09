class QRData {
  String name;
  String price;
  String vendor;
  String image;

  QRData({this.name, this.price, this.vendor, this.image});

  factory QRData.fromJson(Map<String, dynamic> json) {
    return QRData(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      vendor: json['vendor'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['vendor'] = this.vendor;
    data['image'] = this.image;
    return data;
  }
}
