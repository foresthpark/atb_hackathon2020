import 'package:atb_hackathon/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uuid/uuid.dart';

class PendingCatgories extends StatefulWidget {
//  static String namedRoute = "/pending-categories";
  PendingCatgories({Key key}) : super(key: key);

  @override
  _PendingCatgoriesState createState() => _PendingCatgoriesState();
}

class _PendingCatgoriesState extends State<PendingCatgories> {
  @override
  Widget build(BuildContext context) {
    var uuid = new Uuid();

    List getList() {
      List<Transaction> txns = [
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 27.47,
            index: uuid.v1()),
        Transaction(
            name: "eBay", date: "11/12/2020", amount: 53.43, index: uuid.v1()),
        Transaction(
            name: "Cineplex",
            date: "11/12/2020",
            amount: 13.22,
            index: uuid.v1()),
        Transaction(
            name: "Burger King",
            date: "11/12/2020",
            amount: 6.33,
            index: uuid.v1()),
        Transaction(
            name: "Walmart",
            date: "11/12/2020",
            amount: 31.23,
            index: uuid.v1()),
        Transaction(
            name: "Canadian Tire",
            date: "11/12/2020",
            amount: 59.93,
            index: uuid.v1()),
        Transaction(
            name: "Winners",
            date: "11/12/2020",
            amount: 23.44,
            index: uuid.v1()),
        Transaction(
            name: "Staples",
            date: "11/12/2020",
            amount: 12.13,
            index: uuid.v1()),
      ];

      return txns;
    }

    List<Transaction> txns = getList();
    final names = txns.map((txn) => txn.name).toList();
    final amounts = txns.map((txn) => txn.amount).toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: txns.length,
        itemBuilder: (context, index) {
          return Slidable(
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
              onDismissed: (actionType) {
                print("SLIDE ACTION:");
                print(actionType);
              },
            ),
            key: UniqueKey(),
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              color: Colors.white,
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigoAccent,
                    child: Text(index.toString()),
                    foregroundColor: Colors.white,
                  ),
                  title: Text(names[index].toString()),
                  subtitle: Text('\$${amounts[index].toString()} CAD'),
                ),
              ),
            ),
            actions: <Widget>[
              IconSlideAction(
                  caption: 'Personal',
                  color: Colors.blue,
                  icon: Icons.account_circle,
                  onTap: () => print("Personal tapped")),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                  caption: 'Business',
                  color: Colors.green,
                  icon: Icons.work,
                  onTap: () => print("Business tapped")),
            ],
          );
        },
      ),
    );
  }
}
