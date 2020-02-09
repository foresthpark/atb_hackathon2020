import 'package:flutter/material.dart';

/// Donut chart example. This is a simple pie chart with a hole in the middle.
import 'package:charts_flutter/flutter.dart' as charts;

var atb_blue = Color.fromRGBO(0, 94, 184, 1);

class OverviewPage extends StatefulWidget {
  OverviewPage({Key key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                alerts,
                Expanded(
                  child: ListView(padding: EdgeInsets.only(top: 0), children: <
                      Widget>[
                    Card(
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'lib/src/assets/imgs/app_logo.png'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                padding: EdgeInsets.only(bottom: 5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage('lib/src/assets/imgs/bubble.png'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: FlatButton(
                                    onPressed: () async {
                                      final String sendMethod =
                                      await _asyncInputDialog(context);
                                      print("You chose to send by $sendMethod");
                                    },
                                    disabledColor: Colors.blue,
                                    disabledTextColor: Colors.white,
                                    child: Text("OK"),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    accounts,
                    recent,
                    business,
                    personal,
                    deductions
                  ]),
                )
              ],
            )));
  }
}

var alerts = Container(
    color: Colors.black87,
    child: Padding(
      padding:
      EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.orange,
            size: 30.0,
          ),
          Text(
            "You have",
            style: TextStyle(color: Colors.white),
          ),
          CircleAvatar(
            backgroundColor: Colors.black45,
            radius: 15.0,
            child: Text(
              "7",
              style: TextStyle(color: Colors.orange),
            ),
          ),
          Text(
            "uncategorized transactions!",
            style: TextStyle(color: Colors.white),
          ),
          FlatButton(
            color: Colors.black45,
            textColor: Colors.white,
            disabledColor: Colors.black45,
            disabledTextColor: Colors.white,
            padding: EdgeInsets.all(10.0),
            splashColor: Colors.blueAccent,
            child: Text("FIX NOW"),
          )
        ],
      ),
    ));

Future<String> _asyncInputDialog(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 10.0),
        title: Text('Where would you like to send your report?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: atb_blue,
                onPressed: () {
                  Navigator.of(context).pop("Email");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.email
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Send to email"),
                    )
                  ],
                )
            ),
            RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: atb_blue,
                onPressed: () {
                  Navigator.of(context).pop("Box");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.cloud
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Upload to Box"),
                    )
                  ],
                )
            ),
            RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: atb_blue,
                onPressed: () {
                  Navigator.of(context).pop("Quickbooks");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.account_balance_wallet
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Submit to Quikbooks"),
                    )
                  ],
                )
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

var accounts = Card(
  child: Container(
    padding: EdgeInsets.only(left: 20.0, right: 15.0, top: 15.0, bottom: 20.0),
    decoration: BoxDecoration(
        border: Border(
            left:
            BorderSide(width: 10.0, color: Color.fromRGBO(0, 94, 184, 1)))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "ACCOUNTS",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20.0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            "\$12,550",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Checking",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "**** **** **** 5678",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$2587.56",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black87,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Savings",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "**** **** **** 2554",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$587.56",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black87,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Visa",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "**** **** **** 8887",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15.0),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$322.88",
                        style: TextStyle(fontSize: 25.0, color: Colors.red),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black87,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "TFSA",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "**** **** **** 4455",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$10004.23",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black87,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Tax",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "(locked until 01/01/2021)",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "**** **** **** 1135",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$518.03",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black87,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "GST",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "(locked until 01/05/2020)",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "**** **** **** 3548",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$123.33",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black87,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  ),
);

var recent = Card(
  child: Container(
    padding: EdgeInsets.only(left: 20.0, right: 15.0, top: 15.0, bottom: 20.0),
    decoration: BoxDecoration(
        border: Border(
            left: BorderSide(
                width: 10.0, color: Color.fromRGBO(181, 128, 209, 1)))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "RECENT TRANSACTIONS",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20.0),
        ),
        DataTable(
          columnSpacing: 30.0,
          horizontalMargin: 0,
          columns: [
            DataColumn(label: Text("Item Name")),
            DataColumn(label: Text("Account")),
            DataColumn(label: Text("Type")),
            DataColumn(label: Text("Amount"))
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text("Baby Yoda Plushie")),
              DataCell(Text("Checking")),
              DataCell(Text("Purchase")),
              DataCell(Text("\$97.99"))
            ]),
            DataRow(cells: [
              DataCell(Text("Sack O' Christmas Cards")),
              DataCell(Text("Credit")),
              DataCell(Text("Purchase")),
              DataCell(Text("\$33.75"))
            ]),
            DataRow(cells: [
              DataCell(Text("Investment")),
              DataCell(Text("TFSA")),
              DataCell(Text("Deposit")),
              DataCell(Text("\$500.00"))
            ]),
            DataRow(cells: [
              DataCell(Text("+1 Battle Axe")),
              DataCell(Text("Credit")),
              DataCell(Text("Purchase")),
              DataCell(Text("\$244.43"))
            ]),
            DataRow(cells: [
              DataCell(Text("Tax Top Up")),
              DataCell(Text("Checking")),
              DataCell(Text("Deposit")),
              DataCell(Text("\$112.12"))
            ]),
            DataRow(cells: [
              DataCell(Text("Wayne Brady Action Figure")),
              DataCell(Text("Savings")),
              DataCell(Text("Purchase")),
              DataCell(Text("\$457.20"))
            ]),
            DataRow(cells: [
              DataCell(Text("GST Top Up")),
              DataCell(Text("Checking")),
              DataCell(Text("Deposit")),
              DataCell(Text("\$27.12"))
            ]),
          ],
        )
      ],
    ),
  ),
);

var personal = Card(
    child: Container(
      padding: EdgeInsets.only(left: 20.0, right: 15.0, top: 15.0, bottom: 20.0),
      decoration: BoxDecoration(
          border: Border(
              left:
              BorderSide(width: 10.0, color: Color.fromRGBO(253, 83, 115, 1)))),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "PERSONAL",
                style: TextStyle(fontSize: 20.0),
              ),
              DropdownButton<String>(
                items: <String>['Month', 'Quarter', 'Year'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                    height: 200.0,
                    child: OrdinalComboBarLineChart.withSampleData2()
                ),
              )
            ],
          ),
          Container(
            height: 210.0,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/src/assets/imgs/graph.png'),
              ),
            ),
          ),
          Container(
            height: 200.0,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/src/assets/imgs/graph2.png'),
              ),
            ),
          ),
        ],
      ),
    ));

var deductions = Card(
    child: Container(
      padding: EdgeInsets.only(left: 20.0, right: 15.0, top: 15.0, bottom: 20.0),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: 10.0, color: Color.fromRGBO(113, 197, 232, 1)))),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "DEDUCTIONS",
                style: TextStyle(fontSize: 20.0),
              ),
              DropdownButton<String>(
                items: <String>['Month', 'Quarter', 'Year'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Travel", style: TextStyle(fontSize: 25.0)),
                  Container(
                    width: 170,
                    height: 170,
                    child: DonutPieChart.withSampleData(),
                  ),
                  Text("\$4000"),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("Utilities", style: TextStyle(fontSize: 25.0)),
                  Container(
                    width: 170,
                    height: 170,
                    child: DonutPieChart.withSampleData2(),
                  ),
                  Text("\$4000"),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Workspace", style: TextStyle(fontSize: 25.0)),
                  Container(
                    width: 170,
                    height: 170,
                    child: DonutPieChart.withSampleData(),
                  ),
                  Text("\$4000"),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("Subscriptions", style: TextStyle(fontSize: 25.0)),
                  Container(
                    width: 170,
                    height: 170,
                    child: DonutPieChart.withSampleData(),
                  ),
                  Text("\$4000"),
                ],
              )
            ],
          )
        ],
      ),
    ));

var business = Card(
    child: Container(
      padding: EdgeInsets.only(left: 20.0, right: 15.0, top: 15.0, bottom: 20.0),
      decoration: BoxDecoration(
          border: Border(
              left:
              BorderSide(width: 10.0, color: Color.fromRGBO(255, 103, 31, 1)))),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "BUSINESS",
                style: TextStyle(fontSize: 20.0),
              ),
              DropdownButton<String>(
                items: <String>['Month', 'Quarter', 'Year'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                    height: 200.0,
                    child: OrdinalComboBarLineChart.withSampleData()
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Tax Owing", style: TextStyle(fontSize: 25.0)),
                  Container(
                    width: 170,
                    height: 170,
                    child: DonutPieChart.withSampleData(),
                  ),
                  Text("\$1244.30"),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("GST Owing", style: TextStyle(fontSize: 25.0)),
                  Container(
                    width: 170,
                    height: 170,
                    child: DonutPieChart.withSampleData2(),
                  ),
                  Text("\$255.67"),
                ],
              )
            ],
          )
        ],
      ),
    )
);

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData2() {
    return new DonutPieChart(
      _createSampleData2(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 30));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(2, 25),
      new LinearSales(3, 80),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  static List<charts.Series<LinearSales, int>> _createSampleData2() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class OrdinalComboBarLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  OrdinalComboBarLineChart(this.seriesList, {this.animate});

  factory OrdinalComboBarLineChart.withSampleData() {
    return new OrdinalComboBarLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  factory OrdinalComboBarLineChart.withSampleData2() {
    return new OrdinalComboBarLineChart(
      _createSampleData2(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.OrdinalComboChart(seriesList,
      animate: animate,
      // Configure the default renderer as a bar renderer.
      defaultRenderer: new charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.grouped),
      // Custom renderer configuration for the line series. This will be used for
      // any series that does not define a rendererIdKey.
      customSeriesRenderers: [
        new charts.LineRendererConfig(
          // ID used to link series to this renderer.
            customRendererId: 'customLine')
      ],
      behaviors: [new charts.SeriesLegend()],);
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData2() {
    final desktopSalesData = [
      new OrdinalSales('2016', 45000),
      new OrdinalSales('2017', 65000),
      new OrdinalSales('2018', 72000),
      new OrdinalSales('2019', 72000),
      new OrdinalSales('2020', 90000),
    ];

    final tableSalesData = [
      new OrdinalSales('2016', 22450),
      new OrdinalSales('2017', 35900),
      new OrdinalSales('2018', 40000),
      new OrdinalSales('2019', 44000),
      new OrdinalSales('2020', 53800),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Income',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData),
      new charts.Series<OrdinalSales, String>(
          id: 'Expenses',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableSalesData),
    ];
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2016', 35000),
      new OrdinalSales('2017', 89400),
      new OrdinalSales('2018', 114500),
      new OrdinalSales('2019', 150000),
      new OrdinalSales('2020', 20000),
    ];

    final tableSalesData = [
      new OrdinalSales('2016', 12400),
      new OrdinalSales('2017', 25000),
      new OrdinalSales('2018', 36900),
      new OrdinalSales('2019', 46999),
      new OrdinalSales('2020', 9000),
    ];

    final mobileSalesData = [
      new OrdinalSales('2016', 60000),
      new OrdinalSales('2017', 25000),
      new OrdinalSales('2018', 26900),
      new OrdinalSales('2019', 35999),
      new OrdinalSales('2020', 1800),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Revenue',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData),
      new charts.Series<OrdinalSales, String>(
          id: 'Net Income',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableSalesData),
      new charts.Series<OrdinalSales, String>(
          id: 'Profit Margin',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: mobileSalesData)
      // Configure our custom line renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customLine'),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}