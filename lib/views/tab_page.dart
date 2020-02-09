import 'package:atb_hackathon/models/MerchantItem.dart';
import 'package:atb_hackathon/views/pending_catgories.dart';
import 'package:atb_hackathon/views/insights.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'credit_card/credit_card.dart';
import 'merchant/view_merchant_items.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(TabPage());

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedIndex = 0;

  PageController controller = PageController();

  List<Widget> views = [
    PendingCatgories(),
    CreditCardScreen(),
    InsightsScreen(),
    ViewMerchantItems(),
  ];

  List<GButton> tabs = new List();
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600],
    Colors.teal
  ];

  @override
  void initState() {
    super.initState();

    var padding = EdgeInsets.symmetric(horizontal: 12, vertical: 5);
    double gap = 30;

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.purple,
      iconColor: Colors.black,
      textColor: Colors.purple,
      color: Colors.purple.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.home,
      // textStyle: t.textStyle,
      text: 'Home',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.pink,
      iconColor: Colors.black,
      textColor: Colors.pink,
      color: Colors.pink.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.heart_o,
      // textStyle: t.textStyle,
      text: 'Likes',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.amber[600],
      iconColor: Colors.black,
      textColor: Colors.amber[600],
      color: Colors.amber[600].withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.search,
      // textStyle: t.textStyle,
      text: 'Search',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.teal,
      iconColor: Colors.black,
      textColor: Colors.teal,
      color: Colors.teal.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.dollar,
      // textStyle: t.textStyle,
      text: 'Merchant',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text(
            'GoogleNavBar',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
            });
          },
          controller: controller,
          itemBuilder: (context, position) {
            return Container(
              color: colors[position],
              child: views[position],
            );
          },
          itemCount: tabs.length, // Can be null
        ),
        // backgroundColor: Colors.green,
        // body: Container(color: Colors.red,),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: -10,
                      blurRadius: 60,
                      color: Colors.black.withOpacity(.20),
                      offset: Offset(0, 15))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: GNav(
                  tabs: tabs,
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    print(index);
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.jumpToPage(index);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

//
//void main() => runApp(TabPage());
//
//class TabPage extends StatefulWidget {
//  @override
//  _TabPageState createState() => _TabPageState();
//}
//
//class _TabPageState extends State<TabPage> {
//  int selectedIndex = 0;
//
//  PageController controller = PageController();
//
//  List<GButton> tabs = new List();
//  List<Color> colors = [
//    Colors.purple,
//    Colors.pink,
//    Colors.amber[600],
//    Colors.teal
//  ];
//
//  List<Widget> views = [
//    PendingCatgories(),
//    CreditCardScreen(),
//    InsightsScreen(),
//    ViewMerchantItems(),
//  ];
//
//  @override
//  void initState() {
//    super.initState();
//
//    var padding = EdgeInsets.symmetric(horizontal: 16, vertical: 5);
//    double gap = 1;
//
//    tabs.add(GButton(
//      gap: gap,
//      iconActiveColor: Colors.purple,
//      iconColor: Colors.black,
//      textColor: Colors.purple,
//      color: Colors.purple.withOpacity(.2),
//      iconSize: 24,
//      padding: padding,
//      icon: LineIcons.list,
//      // textStyle: t.textStyle,
//      text: 'Expenses',
//    ));
//
//    tabs.add(GButton(
//      gap: gap,
//      iconActiveColor: Colors.pink,
//      iconColor: Colors.black,
//      textColor: Colors.pink,
//      color: Colors.pink.withOpacity(.2),
//      iconSize: 24,
//      padding: padding,
//      icon: LineIcons.credit_card,
//      // textStyle: t.textStyle,
//      text: 'Pay',
//    ));
//
//    tabs.add(GButton(
//      gap: gap,
//      iconActiveColor: Colors.amber[600],
//      iconColor: Colors.black,
//      textColor: Colors.amber[600],
//      color: Colors.amber[600].withOpacity(.2),
//      iconSize: 24,
//      padding: padding,
//      icon: LineIcons.bar_chart,
//      // textStyle: t.textStyle,
//      text: 'Insights',
//    ));
//    tabs.add(GButton(
//      gap: gap,
//      iconActiveColor: Colors.green[600],
//      iconColor: Colors.black,
//      textColor: Colors.green[600],
//      color: Colors.green[600].withOpacity(.2),
//      iconSize: 24,
//      padding: padding,
//      icon: LineIcons.dollar,
//      // textStyle: t.textStyle,
//      text: 'Insights',
//    ));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        extendBody: true,
//        body: PageView.builder(
//          onPageChanged: (page) {
//            setState(() {
//              selectedIndex = page;
//            });
//          },
//          controller: controller,
//          itemBuilder: (context, position) {
//            return Container(
//              color: colors[position],
//              child: views[position],
//            );
//          },
//          itemCount: tabs.length, // Can be null
//        ),
//        // backgroundColor: Colors.green,
//        // body: Container(color: Colors.red,),
//        bottomNavigationBar: SafeArea(
//          child: Container(
//            margin: EdgeInsets.symmetric(horizontal: 10),
//            decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.all(Radius.circular(100)),
//                boxShadow: [
//                  BoxShadow(
//                      spreadRadius: -10,
//                      blurRadius: 60,
//                      color: Colors.black.withOpacity(.20),
//                      offset: Offset(0, 15))
//                ]),
//            child: Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
//              child: GNav(
//                  tabs: tabs,
//                  selectedIndex: selectedIndex,
//                  onTabChange: (index) {
//                    setState(() {
//                      selectedIndex = index;
//                    });
//                    controller.jumpToPage(index);
//                  }),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
