import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_salesman/pages/HomePage.dart';
import 'package:flutter_salesman/pages/Orders.dart';
import 'package:flutter_salesman/pages/Orders1.dart';
import 'package:flutter_salesman/pages/Orders2.dart';
import 'package:flutter_salesman/pages/Party1.dart';
import 'package:flutter_salesman/pages/Party2.dart';
import 'package:flutter_salesman/pages/Previousorders.dart';
import 'package:flutter_salesman/pages/Takeorder.dart';
import 'package:flutter_salesman/pages/Territory1.dart';
import 'package:flutter_salesman/pages/Territory2.dart';
import 'package:flutter_salesman/pages/itemdetails.dart';
import 'package:flutter_salesman/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'pages/LoginForm.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //routes
      routes: {
        LoginForm.routeName: (context) => LoginForm(),
        HomePage.routeName: (context) => HomePage(),
        Territory1.routeName: (context) => Territory1(),
        Territory2.routeName: (context) => Territory2(),
        Party1.routeName: (context) => Party1(),
        Party2.routeName: (context) => Party2(),
        Orders.routeName: (context) => Orders(),
        Orders1.routeName: (context) => Orders1(),
        Orders2.routeName: (context) => Orders2(),
        Previousorders.routeName: (context) => Previousorders(),
        Takeorder.routeName: (context) => Takeorder(),
        itemdetails.routeName: (context) => itemdetails(),
      },

      title: 'Salesman App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Constants.prefs?.getBool("LoggedIn") == false
          ? HomePage()
          : MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginForm())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: Image.asset("assets/login/screen.gif"));
  }
}
