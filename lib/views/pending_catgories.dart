import 'dart:async';

import 'package:atb_hackathon/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:io';
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
      List<Transaction> listers = [
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 53.43,
            index: uuid.v1()),
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 53.43,
            index: uuid.v1()),
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 53.43,
            index: uuid.v1()),
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 53.43,
            index: uuid.v1()),
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 53.43,
            index: uuid.v1()),
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 53.43,
            index: uuid.v1()),
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 53.43,
            index: uuid.v1()),
        Transaction(
            name: "Amazon",
            date: "11/12/2020",
            amount: 53.43,
            index: uuid.v1()),
      ];

      return listers;
    }

    List<Transaction> listers2 = [
      Transaction(
          name: "Amazon", date: "11/12/2020", amount: 11.43, index: uuid.v1()),
      Transaction(
          name: "Amazon", date: "11/12/2020", amount: 11.43, index: uuid.v1()),
      Transaction(
          name: "Amazon", date: "11/12/2020", amount: 11.43, index: uuid.v1()),
      Transaction(
          name: "Amazon", date: "11/12/2020", amount: 11.43, index: uuid.v1()),
      Transaction(
          name: "Amazon", date: "11/12/2020", amount: 11.43, index: uuid.v1()),
    ];

    List listers = getList();

    void delete(String uuid) {
      listers.removeWhere((eng) => eng.index == uuid);
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: listers.length,
        itemBuilder: (context, index) {
          return Slidable(
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
              onDismissed: (actionType) {
                print(actionType);
//                setState(() {
//                  listers.removeAt(index);
//                  listers = [];
//                });
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
                  title: Text('Tile n°$index'),
                  subtitle: Text('SlidableDrawerDelegate'),
                ),
              ),
            ),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Archive',
                color: Colors.blue,
                icon: Icons.archive,
                onTap: () => print("Arvhice Pressed"),
              ),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  print("Delete Pressed11");

                  print(listers.length);
                  setState(() {});
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
