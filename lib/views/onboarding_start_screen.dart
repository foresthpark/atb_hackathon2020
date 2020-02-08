import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// On Boarding Screen only Once
// https://stackoverflow.com/questions/59241566/flutter-onboarding-screen-only-one-time

class OnboardingStartScreen extends StatefulWidget {
  OnboardingStartScreen({Key key}) : super(key: key);

  @override
  _OnboardingStartScreenState createState() => _OnboardingStartScreenState();
}

class _OnboardingStartScreenState extends State<OnboardingStartScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 5;
  String officeSpaceQuestion = "Input your office Space";

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 140),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive ? 24 : 16,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.1,
                  0.9
                ],
                colors: [
                  Color(0xff71C5E8),
                  Color(0xff005EB8),
                ]),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      print("pressed skip");
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              officeSpaceQuestion,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              officeSpaceQuestion,
                              style: TextStyle(
                                  fontSize: 20,
//                                fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Square ft",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText:
                                    "Entehr the square footage of your office",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/clipart2.png',
                                height: 300,
                                width: 300,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Build new experiences\nwith new people',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et',
                              style: TextStyle(
                                  fontSize: 20,
//                                fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/clipart3.png',
                                height: 300,
                                width: 300,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Imagination is just at\nthe tip of your fingers',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et',
                              style: TextStyle(
                                  fontSize: 20,
//                                fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/clipart3.png',
                                height: 300,
                                width: 300,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Imagination is just at\nthe tip of your fingers',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et',
                              style: TextStyle(
                                  fontSize: 20,
//                                fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/clipart3.png',
                                height: 300,
                                width: 300,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Imagination is just at\nthe tip of your fingers',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et',
                              style: TextStyle(
                                  fontSize: 20,
//                                fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(microseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  print('Get Started');
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Color(0xFF5B16D0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
