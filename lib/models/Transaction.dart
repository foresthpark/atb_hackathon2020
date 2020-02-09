class Transaction {
  final double amount;
  final String date;
  final String name;
  final String index;
  final String category;

  Transaction({this.amount, this.date, this.name, this.index, this.category});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        amount: json['amount'],
        date: json['date'],
        name: json['name'],
        index: json['index'],
        category: json['category']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['name'] = this.name;
    data['index'] = this.index;
    data['category'] = this.category;
    return data;
  }
}
