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
            child: txnCard(amounts, names, index, categories, dates),
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

Widget txnCard(amounts, names, index, categories, dates) {
  void handleTxnTap() {
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

  Text categoryToAmount(double amount, String category) {
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

  return Card(
    child: ListTile(
      leading: categoryToIcon(categories[index]),
      title: categoryToAmount(amounts[index], categories[index]),
      subtitle: Text('''
${names[index].toString()}
${dates[index]}
          '''),
      trailing: categories[index] == "milage" ? Icon(Icons.map) : null,
      onTap: handleTxnTap,
      isThreeLine: true,
    ),
  );
}

