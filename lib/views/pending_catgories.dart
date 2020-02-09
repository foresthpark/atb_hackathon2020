import 'package:atb_hackathon/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
                if (actionType == SlideActionType.primary) {
                  print("saved to business");
                  txns.removeAt(index);
                  print(txns.length);
                } else {
                  print("Saved to personal");
                  txns.removeAt(index);
                  print(txns.length);
                }
              },
            ),
            key: UniqueKey(),
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              color: Colors.white,
              child: Card(
                child: ListTile(
                  onLongPress: () {
                    print("This is a fake transaction");
                    Alert(
                      context: context,
                      image: Image.network("https://i.imgur.com/TbnoEKB.png"),
                      type: AlertType.error,
                      title: "FRAUDULANT TRANSACTION",
                      desc: "Are you sure this is a fradulant transaction?",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "NO",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          color: Colors.white,
                        ),
                        DialogButton(
                          child: Text(
                            "YES",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Alert(
                              context: context,
                              type: AlertType.error,
                              title: "SUCCESS",
                              desc:
                                  "This transaction was successfully reported",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "COOL",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                )
                              ],
                            ).show();
                          },
                          color: Colors.red,
//                          gradient: LinearGradient(colors: [
//                            Color.fromRGBO(116, 116, 191, 1.0),
//                            Color.fromRGBO(52, 138, 199, 1.0)
//                          ]),
                        )
                      ],
                    ).show();
                  },
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
