class Transaction {
  double amount;
  String date;
  String name;
  String index;

  Transaction({this.amount, this.date, this.name, this.index});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        amount: json['amount'],
        date: json['date'],
        name: json['name'],
        index: json['index']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['name'] = this.name;
    data['index'] = this.index;
    return data;
  }
}
