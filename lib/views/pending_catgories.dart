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
            name: "John Jones",
            date: "2020-02-09",
            amount: 27.47,
            index: uuid.v1(),
            category: "income"),
        Transaction(
            name: "eBay",
            date: "2020-02-09",
            amount: 53.43,
            index: uuid.v1(),
            category: "shopping"),
        Transaction(
            name: "Milage",
            date: "2020-02-09",
            amount: 56,
            index: uuid.v1(),
            category: "milage"),
        Transaction(
            name: "Burger King",
            date: "2020-02-09",
            amount: 6.33,
            index: uuid.v1(),
            category: "food"),
        Transaction(
            name: "Sue Simmons",
            date: "2020-02-08",
            amount: 31.23,
            index: uuid.v1(),
            category: "income"),
        Transaction(
            name: "Canadian Tire",
            date: "2020-02-08",
            amount: 59.93,
            index: uuid.v1(),
            category: "shopping"),
        Transaction(
            name: "Winners",
            date: "2020-02-08",
            amount: 23.44,
            index: uuid.v1(),
            category: "shopping"),
        Transaction(
            name: "Staples",
            date: "2020-02-08",
            amount: 12.13,
            index: uuid.v1(),
            category: "shopping"),
      ];

      return txns;
    }

    List<Transaction> txns = getList();
    final names = txns.map((txn) => txn.name).toList();
    final amounts = txns.map((txn) => txn.amount).toList();
    final categories = txns.map((txn) => txn.category).toList();
    final dates = txns.map((txn) => txn.date).toList();

    void handleTxnTap(index) {
      final cat = categories[index];
      if (cat == 'milage') {
        print("Milage clicked");
      } else {
        print("NOT Milage clicked");
      }
    }

    Icon categoryToIcon(String category) {
      switch (category) {
        case 'milage':
          {
            return Icon(Icons.directions_car);
          }
          break;
        case 'food':
          {
            return Icon(Icons.fastfood);
          }
          break;
        case 'income':
          {
            return Icon(Icons.attach_money, color: Colors.green);
          }
          break;
        case 'shopping':
          {
            return Icon(Icons.shopping_cart);
          }
          break;
        default:
          {
            return Icon(Icons.attach_money);
          }
          break;
      }
    }

    Text categoryToAmount(double amount, String category, int index) {
      switch (category) {
        case "income":
          {
            return Text('\$${amounts[index].toString()} CAD',
                style: TextStyle(color: Colors.green));
          }
          break;
        case "milage":
          {
            return Text("${amount.toString()} km");
          }
          break;
        default:
          {
            return Text('-\$${amounts[index].toString()} CAD');
          }
          break;
      }
    }

    Future<String> _asyncInputDialog2(BuildContext context) async {
      return showDialog<String>(
        context: context,
        barrierDismissible: false,
        // dialog is dismissible with a tap on the barrier
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 10.0),
            title: Center(
                child: Text('Transaction has been successfully reported')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop("Box");
                  },
                  child: Text("Cool"),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop("None");
                },
              ),
            ],
          );
        },
      );
    }

    Future<String> _asyncInputDialog1(BuildContext context) async {
      return showDialog<String>(
        context: context,
        barrierDismissible: false,
        // dialog is dismissible with a tap on the barrier
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 10.0),
            title: Center(
                child: Text('Would you like to report this transaction?')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.black12,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop("Box");
                  },
                  child: Text("NO"),
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () async {
                    await Navigator.of(context).pop("Box");
                    _asyncInputDialog2(context);
                  },
                  child: Text("YES"),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop("None");
                },
              ),
            ],
          );
        },
      );
    }

    void presentAlert() {
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
              style: TextStyle(color: Colors.black26, fontSize: 20),
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
                desc: "This transaction was successfully reported",
                buttons: [
                  DialogButton(
                    child: Text(
                      "COOL",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                  )
                ],
              ).show();
            },
            color: Colors.red,
          )
        ],
      ).show();
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: txns.length,
        itemBuilder: (context, index) {
          return Slidable(
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
              onDismissed: (actionType) {
                final snackBar = SnackBar(
                  content: actionType == SlideActionType.primary
                      ? Text('Grouped as personal expense')
                      : Text('Grouped as business expense'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      getList();
                      // Some code to undo the change.
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            ),
            key: UniqueKey(),
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Card(
              child: ListTile(
                onLongPress: () {
                  print("This is a fake transaction");
                  _asyncInputDialog1(context);
                },
                leading: categoryToIcon(categories[index]),
                title:
                    categoryToAmount(amounts[index], categories[index], index),
                subtitle: Text('${names[index].toString()} [${dates[index]}]'),
                trailing:
                    categories[index] == "milage" ? Icon(Icons.map) : null,
                onTap: () {},
                isThreeLine: true,
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
