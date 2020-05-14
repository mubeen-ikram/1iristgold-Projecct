import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irisgoldproject/widgets/NavigationDrawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => WelcomeScreen(),
      '/home': (context) => MyHomeScreen(),
      '/register_welcome_screen': (context) => RegisterWelcomeScreen(),
      '/word_seed_check_screen': (context) => WordSeedCheckScreen(),
      '/word_seed_show_screen': (context) => WordSeedShowScreen(),
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
              child: Text(
                "Register & Install",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              color: Color.fromRGBO(191, 144, 0, 1),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/register_welcome_screen');
              },
            )
          ],
        )),
      ),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    );
  }
}

class RegisterWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Center(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Image(
                width: 250,
                height: 230,
                image: AssetImage('assets/1irstgold.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Center(
                  child: Text(
                'Payment & Storage Solutions in the era of Blockchain',
                style: TextStyle(
                    color: Color.fromRGBO(191, 144, 0, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: Center(
                  child: Text(
                'Start registering now and experience the revolution in gold trading and storage',
                style: TextStyle(
                    color: Color.fromRGBO(191, 144, 0, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: 230,
              child: FlatButton(
                child: Text(
                  "I already have a  Wallet",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                color: Color.fromRGBO(191, 144, 0, 1),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/word_seed_check_screen');
                },
              ),
            ),
            SizedBox(height: 30.0),
            SizedBox(
              width: 230,
              child: FlatButton(
                child: Text(
                  "Register New Wallet",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                color: Color.fromRGBO(191, 144, 0, 1),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/word_seed_show_screen');
                },
              ),
            ),
          ],
        )),
      ),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    );
  }
}

class WordSeedShowScreen extends StatefulWidget {
  @override
  _WordSeedShowScreenState createState() => _WordSeedShowScreenState();
}

class _WordSeedShowScreenState extends State<WordSeedShowScreen> {
  List<String> seedWords = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'eight',
    'nine',
    'ten',
    'seven',
    'eleven',
    'twelve',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  width: 250,
                  height: 140,
                  image: AssetImage('assets/1irstgold.png'),
                ),
              ),
              Card(
                child: Container(
                  child: SizedBox(
                    height: 220,
                    width: 350,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: seedWords
                          .map((e) => Padding(
                                padding: const EdgeInsets.fromLTRB(2, 1, 2, 1),
                                child: FlatButton(
                                    onPressed: () {},
                                    child: Column(children: [
                                      Text(
                                        (seedWords.indexOf(e) + 1).toString() +
                                            "-" +
                                            e,
                                        style: TextStyle(
                                          fontSize: 18,
                                          wordSpacing: 1,
                                        ),
                                      ),
                                    ])),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                color: Color.fromRGBO(191, 144, 0, 1),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Center(
                    child: Text(
                  'Please secure your password phrase of the 12 words above before proceeding.\nKeep them safe from access by thrid party.If you IGNORE this, You can LOSE all assets from your wallet',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1), fontSize: 15),
                  textAlign: TextAlign.center,
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: FlatButton(
                  color: Color.fromRGBO(191, 144, 0, 1),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/word_seed_check_screen');
                  },
                  child: Text('Next & Proceed'),
                ),
              ),
            ],
          )),
        ),
      ),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    );
  }
}

class WordSeedCheckScreen extends StatefulWidget {
  @override
  _WordSeedCheckScreenState createState() => _WordSeedCheckScreenState();
}

class _WordSeedCheckScreenState extends State<WordSeedCheckScreen> {
  List<String> seedWords = [

  ];
  final newTextAdded = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  width: 250,
                  height: 140,
                  image: AssetImage('assets/1irstgold.png'),
                ),
              ),
              Card(
                child: Container(
                  child: SizedBox(
                    height: 220,
                    width: 350,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: seedWords
                          .map((e) => Padding(
                                padding: const EdgeInsets.fromLTRB(2, 1, 2, 1),
                                child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        seedWords.remove(e);
                                      });
                                    },
                                    child: Column(children: [
                                      Text(
                                        (seedWords.indexOf(e) + 1).toString() +
                                            "-" +
                                            e,
                                        style: TextStyle(
                                          fontSize: 18,
                                          wordSpacing: 1,
                                        ),
                                      ),
                                    ])),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                color: Color.fromRGBO(191, 144, 0, 1),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                child: Container(
                  color: Color.fromRGBO(191, 144, 0, 1),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 4, 0),
                    child: TextField(
                      onSubmitted: (value) => setState(() {
                        if (seedWords.indexOf(newTextAdded.text) == -1) {
                          seedWords.add(newTextAdded.text);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: Text('Word Already entered'));
                            },
                          );
                        }
                        newTextAdded.text = '';
                      }),
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Enter Next Word'),
                      controller: newTextAdded,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Center(
                    child: Text(
                  'Please insert your 12 know passwords in the system window and then press the button below\n\nNote: All transactions based on Etherium Blockchain require ETH to pay fee.You absolutely have to deposit ETH into your wallet and be able to use it without restrictions',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1), fontSize: 15),
                  textAlign: TextAlign.center,
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: FlatButton(
                  color: Color.fromRGBO(191, 144, 0, 1),
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacementNamed(context, '/home');
                    });
                  },
                  child: Text('Next & Proceed'),
                ),
              ),
            ],
          )),
        ),
      ),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    );
  }
}
