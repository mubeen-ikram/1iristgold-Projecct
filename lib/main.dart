import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irisgoldproject/widgets/NavigationDrawer.dart';
import 'package:http/http.dart';
import 'dart:math' as math;
import 'package:bip39/bip39.dart' as bip39;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_core/wallet_core.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => AboutScreen(),
      '/welcome_screen': (context) => WelcomeScreen(),
      '/home': (context) => MyHomeScreen(),
      '/register_welcome_screen': (context) => RegisterWelcomeScreen(),
      '/word_seed_check_screen': (context) => WordSeedCheckScreen(),
      '/word_seed_show_screen': (context) => WordSeedShowScreen(),
      '/conversion_screen': (context) => ConversionScreen(),
      '/about_screen': (context) => AboutScreen(),
    }));

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Future<void> checkPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String counter = prefs.getString('key') ?? '';
    print(counter);
    if (counter == '') {
      setState(() {
        Navigator.pushReplacementNamed(context, '/welcome_screen');
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPrefrence();
  }

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

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPrefrence();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 300,
              height: 275,
              image: AssetImage('assets/images/1irstgold.png'),
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
                Navigator.pushReplacementNamed(
                    context, '/register_welcome_screen');
              },
            )
          ],
        )),
      ),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    );
  }

  Future<void> checkPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String counter = prefs.getString('key') ?? '';
    print(counter + "welcome");
    if (counter != '') {
      setState(() {
        Navigator.pushReplacementNamed(context, '/home');
      });
    }
  }
}

class RegisterWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                image: AssetImage('assets/images/1irstgold.png'),
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
  bool isLoaded = false;
  List<String> seedWords = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setHDWallet();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Image(
                        width: 250,
                        height: 160,
                        image: AssetImage('assets/images/1irstgold.png'),
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
                                      padding:
                                          const EdgeInsets.fromLTRB(2, 1, 2, 1),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Column(children: [
                                            Text(
                                              (seedWords.indexOf(e) + 1)
                                                      .toString() +
                                                  "-" +
                                                  e,
                                              style: TextStyle(
                                                fontSize: 15,
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
                            color: Color.fromRGBO(191, 144, 0, 1),
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 5),
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

  void setHDWallet() {
    setState(() {
      isLoaded = false;
    });
    String seedWord = Web3.generateMnemonic();
    setState(() {
      seedWords = seedWord.split(' ');
      isLoaded = true;
    });
  }
}

class WordSeedCheckScreen extends StatefulWidget {
  @override
  _WordSeedCheckScreenState createState() => _WordSeedCheckScreenState();
}

class _WordSeedCheckScreenState extends State<WordSeedCheckScreen> {
  List<String> seedWords = [];
  final newTextAdded = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  image: AssetImage('assets/images/1irstgold.png'),
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
                    setState(() async {
                      if (seedWords.length != 12) return;
                      String result = '';
                      for (int i = 0; i < seedWords.length; i++) {
                        result += seedWords[i] + ' ';
                      }
                      print(result);
                      result = Web3.privateKeyFromMnemonic(result);
                      Credentials fromHex = EthPrivateKey.fromHex(result);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('key', result);
                      Navigator.pushReplacementNamed(context, '/home',
                          arguments: {'key': result});
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

class ConversionScreen extends StatefulWidget {
  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  final topEditText = TextEditingController();
  final bottomEditText = TextEditingController();
  bool isGoldTop = true;
  bool isLoading = false;
  double goldToUsdtValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isLoading = true;
    });
    getConversionVariable('1GOLD', 'USDT', '0');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: !isLoading
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 350,
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.grey[800],
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  height: 150,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[800]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'You Pay',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      191, 144, 0, 1),
                                                  fontSize: 15),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      width: 150,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 5, 0, 5),
                                                        child: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      191,
                                                                      144,
                                                                      0,
                                                                      1)),
                                                          onSubmitted:
                                                              (value) =>
                                                                  setState(() {
                                                            isLoading = true;
                                                            getConversionVariable(
                                                                isGoldTop
                                                                    ? '1GOLD'
                                                                    : 'USDT',
                                                                !isGoldTop
                                                                    ? '1GOLD'
                                                                    : 'USDT',
                                                                topEditText
                                                                    .text);
                                                          }),
                                                          decoration: new InputDecoration
                                                                  .collapsed(
                                                              hintText: isGoldTop
                                                                  ? 'Enter 1IristGold'
                                                                  : 'Enter Tether USD',
                                                              fillColor: Color
                                                                  .fromRGBO(
                                                                      191,
                                                                      144,
                                                                      0,
                                                                      1)),
                                                          controller:
                                                              topEditText,
                                                        ),
                                                      ),
                                                    ),
                                                    Image(
                                                        width: !isGoldTop
                                                            ? 40
                                                            : 50,
                                                        image: AssetImage(!isGoldTop
                                                            ? 'assets/images/tether.png'
                                                            : 'assets/images/1irstgold.png')),
                                                    Text(!isGoldTop
                                                        ? 'Tether'
                                                        : '1Gold')
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              isGoldTop
                                                  ? 'Balance 0 1GOLD'
                                                  : 'Balance 0 USDT',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      191, 144, 0, 1),
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  height: 150,
                                  left: 0,
                                  right: 0,
                                  top: 150,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[800]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'You Get',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      191, 144, 0, 1),
                                                  fontSize: 15),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 150,
                                                    child: TextField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onSubmitted: (value) =>
                                                          setState(() {
                                                        isLoading = true;
                                                        getConversionVariable(
                                                            !isGoldTop
                                                                ? '1GOLD'
                                                                : 'USDT',
                                                            isGoldTop
                                                                ? '1GOLD'
                                                                : 'USDT',
                                                            bottomEditText
                                                                .text);
                                                      }),
                                                      decoration: new InputDecoration
                                                              .collapsed(
                                                          hintText: isGoldTop
                                                              ? 'Enter 1IristGold'
                                                              : 'Enter Tether USD',
                                                          fillColor:
                                                              Color.fromRGBO(
                                                                  191,
                                                                  144,
                                                                  0,
                                                                  1)),
                                                      controller:
                                                          bottomEditText,
                                                    ),
                                                  ),
                                                  Image(
                                                      width:
                                                          isGoldTop ? 40 : 50,
                                                      image: AssetImage(isGoldTop
                                                          ? 'assets/images/tether.png'
                                                          : 'assets/images/1goldsmall.png')),
                                                  Text(isGoldTop
                                                      ? 'Tether'
                                                      : '1Gold')
                                                ],
                                              ),
                                            ),
                                            Text(
                                              !isGoldTop
                                                  ? 'Balance 0 1GOLD'
                                                  : 'Balance 0 USDT',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      191, 144, 0, 1),
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  height: 30,
                                  top: 130,
                                  right: 30,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        topEditText.text = '';
                                        bottomEditText.text = '';
                                        isGoldTop = !isGoldTop;
                                      });
                                    },
                                    splashColor: Color.fromRGBO(191, 144, 0, 1),
                                    backgroundColor: Colors.black,
                                    child: Transform.rotate(
                                      angle: 90 * math.pi / 180,
                                      child: Icon(
                                        Icons.compare_arrows,
                                        color: Color.fromRGBO(191, 144, 0, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(''),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "1 1IRISTGOLD ~ " + goldToUsdtValue.toString() + ' USDT',
                      style: TextStyle(
                        color: Color.fromRGBO(191, 144, 0, 1),
                      ),
                    ),
                    FlatButton(
                      color: Color.fromRGBO(191, 144, 0, 1),
                      onPressed: () {},
                      child: Text("Next"),
                    )
                  ],
                ),
              )
            : SpinKitCircle(
                color: Colors.white,
                size: 50.0,
              ),
      ),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    );
  }

  void getConversionVariable(fromSymbol, toSymbol, amount) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-CMC_PRO_API_KEY': '07467c82-b1d6-4ddc-907a-b5e821602fe0'
    };
    String url = '';
    if (amount == '0')
      url =
          'https://pro-api.coinmarketcap.com/v1/tools/price-conversion?amount=' +
              '1' +
              '&symbol=' +
              fromSymbol +
              '&convert=' +
              toSymbol;
    else {
      url =
          'https://pro-api.coinmarketcap.com/v1/tools/price-conversion?amount=' +
              amount +
              '&symbol=' +
              fromSymbol +
              '&convert=' +
              toSymbol;
    }
    Response response = await get(url, headers: requestHeaders);
    final Map parsed = json.decode(response.body);
    print(parsed);
    setState(() {
      if (amount == '0') {
        goldToUsdtValue = parsed['data']['quote']['USDT']['price'];
        print(goldToUsdtValue);
      } else {
        if (isGoldTop) {
          if (topEditText.text == amount) {
            bottomEditText.text =
                parsed['data']['quote']['USDT']['price'].toString();
          } else {
            topEditText.text =
                parsed['data']['quote']['1GOLD']['price'].toString();
          }
        } else {
          if (topEditText.text == amount) {
            bottomEditText.text =
                parsed['data']['quote']['1GOLD']['price'].toString();
          } else {
            topEditText.text =
                parsed['data']['quote']['USDT']['price'].toString();
          }
        }
      }
      isLoading = false;
      print("loading" + isLoading.toString());
    });
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Legal & Imprint',
                    style: TextStyle(
                        color: Color.fromRGBO(191, 144, 0, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    width: 250,
                    height: 200,
                    image: AssetImage('assets/images/1irstgold.png'),
                  ),
                ),
              ],
            ),
//            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Center(
                  child: Text(
                'The use of this application is at the user\'s  own expense and on his own responsibility in all legal matters, whether for loss or for incorrect technical operation of the application. The entire functions of the application are decentralized from peer to peer. We ourselves do not store any data and we do not carry out any financial services.We only ensure the functionality of this decentralized application.',
                style: TextStyle(
                    color: Color.fromRGBO(191, 144, 0, 1),
                    fontSize: 15),
                textAlign: TextAlign.center,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Development & Technical Support\n 1irstcoin LLC./nFree Industrial Zone\n Company ID: 404565029\n Avtomshenebeli 88\n4600 Kutaissi\n Republic of Georgia\nhttps://www.1irstgold.com\nSupport & Customer Hotline\nEmail: support@1irstgold.com",
                  style: TextStyle(color: Color.fromRGBO(191, 144, 0, 1), fontSize: 15,
                ),
              ),
              ),
            )
          ],
        )),
      ),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    );
  }
}
