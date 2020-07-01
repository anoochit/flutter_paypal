import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paypal_webview/services/paypal_payment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text("PayPal Test"),
            ),
            body: Center(
              child: RaisedButton(
                onPressed: () {
                  // make PayPal payment
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PaypalPayment(
                        onFinish: (number) async {
                          // payment done
                          log('order id: ' + number);
                        },
                      ),
                    ),
                  );
                },
                child: Text(
                  'Pay with Paypal',
                  textAlign: TextAlign.center,
                ),
              ),
            )));
  }
}
