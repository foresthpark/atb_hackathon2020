import 'package:atb_hackathon/views/pending_catgories.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'overview/overview.dart';
import 'credit_card/credit_card.dart';
import 'merchant/view_merchant_items.dart';

void main() => runApp(TabPage());

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedIndex = 0;

  PageController controller = PageController();

  List<GButton> tabs = new List();
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600],
    Colors.teal
  ];

  List<Widget> views = [
    OverviewPage(),
    PendingCatgories(),
    CreditCardScreen(),
    ViewMerchantItems()
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
      text: 'Overview',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.purple,
      iconColor: Colors.black,
      textColor: Colors.purple,
      color: Colors.purple.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.list,
      text: 'Expenses',
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
      text: 'Likes',
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
      text: 'Merchant',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
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
