import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irisgoldproject/widgets/NavigationDrawer.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => WelcomeScreen(),
    }));

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Side menu'),
      ),
      body: Center(
        child: Text('Side Menu Tutorial'),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Center(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 300,
              height: 275,
              image: AssetImage('assets/1irstgold.png'),
            ),
            Center(
                child: Text(
              'Payment & Storage Solutions in the era of Blockchain',
              style: TextStyle(
                  color: Color.fromRGBO(191, 144, 0, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: 20.0),
            Center(
                child: Text(
              'become part of our community,decentralized & secure',
              style: TextStyle(
                  color: Color.fromRGBO(191, 144, 0, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: 20.0),
            FlatButton(
              child:Text(
                  "Register & Install",
                style: TextStyle(
                  color: Colors.black,
                    fontSize: 18
                ),
              ),
              color:  Color.fromRGBO(191, 144, 0, 1),
              onPressed: () {  },
            )
          ],
        )),
      ),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    );
  }
}
