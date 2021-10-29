import 'package:flutter/material.dart';
import 'package:flutter_salesman/Sub_pages/runrate.dart';
import 'package:flutter_salesman/pages/LoginForm.dart';
import 'package:flutter_salesman/pages/Territory1.dart';
import 'package:flutter_salesman/pages/Territory2.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_salesman/main.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import '../Sub_pages/drawer.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<HomePage> {
  bool _hasBeenPressed = true;
  @override
  Widget build(BuildContext context) {
    var child;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Salesman App"),
        //backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.cyanAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.cyan, Colors.cyanAccent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(70),
                      bottomRight: const Radius.circular(70),
                    ),
                  ),
                  child: runrate(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
            child: Center(
              child: Container(
                width: 120,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  textColor: Colors.white,
                  child: Ink(
                    decoration: _hasBeenPressed
                        ? BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF9520), Color(0xFFFF6F00)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0))
                        : BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.lightBlue, Colors.lightGreen],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 120.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: _hasBeenPressed
                          ? Text(
                              "Check In",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )
                          : Text(
                              "Checked In",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
                child: Center(
                  child: Container(
                    width: 300,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Territory1.routeName)
                            .then((result) {
                          print(result);
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.cyan.shade100],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.streetview_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  'Territory 1',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Container(
                    width: 300,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Territory2.routeName)
                            .then((result) {
                          print(result);
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.cyan.shade100],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.streetview_outlined,
                                  color: Colors.black54,
                                ),
                                Text(
                                  'Territory 2',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
      drawer: drawer(),
    );
  }
}
