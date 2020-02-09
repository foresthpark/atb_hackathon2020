import 'package:atb_hackathon/views/pending_catgories.dart';
import 'package:atb_hackathon/views/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  var listPagesViewModel = [
    PageViewModel(
      title: "What is your anticipated income for this year?",
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Dollars \$",
              labelStyle: TextStyle(color: Colors.black),
              hintText: "Enter your anticipated income",
              hintStyle: TextStyle(color: Colors.black12),
            ),
          ),
        ],
      ),
      image: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          child: Image.asset('assets/boy-with-glasses.png'),
        ),
      ),
    ),
    PageViewModel(
      title: "What is the projected revenue of your side hustle?",
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Dollars \$",
              labelStyle: TextStyle(color: Colors.black),
              hintText: "Enter projected side husetle revenue",
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      image: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          child: Image.asset('assets/girl-with-glasses.png'),
        ),
      ),
    ),
    PageViewModel(
      title: "What is the square footage of your residence?",
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Square ft",
              labelStyle: TextStyle(color: Colors.black),
              hintText: "Enter the square footage of your residence",
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      image: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          child: Image.asset('assets/girl-with-glasses2.png'),
        ),
      ),
    ),
    PageViewModel(
      title: "What is the square footage of you side hustle office space used?",
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Square ft",
              labelStyle: TextStyle(color: Colors.black),
              hintText: "Enter the square footage of your office",
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      image: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          child: Image.asset('assets/boy-with-glasses2.png'),
        ),
      ),
    ),
    PageViewModel(
      title: "Thank you!",
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Let's go save some money!",
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
      image: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          child: Image.asset('assets/girl-in-wavy-hair-and-glasses-1.png'),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        freeze: true,
        onDone: () {
          // When done button is press
          print('This is onDone');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TabPage()),
          );
        },
        onSkip: () {
          // You can also override onSkip callback
        },
//        curve: Curves.easeIn,
        showSkipButton: true,
        skip: const Icon(Icons.done_all),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blue,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            )),
      ),
    );
  }
}
