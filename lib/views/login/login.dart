import 'package:flutter/material.dart';
import 'package:atb_hackathon/views/intro_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Text("EXPENSE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 30.0)),
                              ),
                              Container(
                                  padding:
                                      EdgeInsets.only(left: 20.0, right: 20.0),
                                  child: Image(
                                      image: AssetImage(
                                          "lib/src/assets/imgs/app_logo.png"),
                                      width: 48.0,
                                      height: 48.0)),
                              Container(
                                child: Text("ROBOT",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 30.0)),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(20.0),
                                    splashColor: Colors.blueAccent,
                                    onPressed: () {},
                                    child: Text(
                                      "Login",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      color: Colors.white,
                                      textColor: Colors.grey,
                                      disabledColor: Colors.grey,
                                      disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(20.0),
                                      splashColor: Colors.blueAccent,
                                      onPressed: () {
                                        /*...*/
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ))
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.all(30.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "BEEP, BOP, BOOP...",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text(
                                              "Ryker Rumsey",
                                              style: TextStyle(fontSize: 40.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text(
                                              "This isn't me",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "lib/src/assets/imgs/riker.jpg"),
                                            radius: 45.0)
                                      ],
                                    )
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
//                                          Navigator.pop(context);
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) {
                                              return IntroScreen();
                                            },
                                          ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 20.0),
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: <Color>[
                                                Color(0xFF0D47A1),
                                                Color(0xFF1976D2),
                                                Color(0xFF42A5F5),
                                              ],
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Text('Login',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 30.0)),
                                        ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Forgot Password",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
