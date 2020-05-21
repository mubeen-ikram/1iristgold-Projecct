import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatelessWidget {


  NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/1irstgold.png'))),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: Text(
                    '1IRSTGOLD',
                    style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1),
                    ),
                  ),
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: Color.fromRGBO(191, 144, 0, 1))),
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.call_made,
                          color: Color.fromRGBO(191, 144, 0, 1),
                        ),
                        Text("Send",
                            style: TextStyle(
                                color: Color.fromRGBO(191, 144, 0, 1),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(191, 144, 0, 1))),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.call_received,
                        color: Color.fromRGBO(191, 144, 0, 1),
                      ),
                      Text("Recieve",
                          style: TextStyle(
                              color: Color.fromRGBO(191, 144, 0, 1),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet,
                color: Color.fromRGBO(191, 144, 0, 1),
              ),
              title: Text('Wallet',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1),
                      fontWeight: FontWeight.bold)),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(
                Icons.compare_arrows,
                color: Color.fromRGBO(191, 144, 0, 1),
              ),
              title: Text('Converter',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1),
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/conversion_screen');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.show_chart,
                color: Color.fromRGBO(191, 144, 0, 1),
              ),
              title: Text('Price Chart',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1),
                      fontWeight: FontWeight.bold)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Color.fromRGBO(191, 144, 0, 1),
              ),
              title: Text('About',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1),
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/about_screen');
                },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Color.fromRGBO(191, 144, 0, 1),
              ),
              title: Text('FAQs',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1),
                      fontWeight: FontWeight.bold)),
              onTap: (){
                Navigator.of(context).pop();
                },
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Color.fromRGBO(191, 144, 0, 1),
              ),
              title: Text('Logout',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 144, 0, 1),
                      fontWeight: FontWeight.bold)),
              onTap: (){
                Navigator.of(context).pop();
              setSharedPreferenceValue(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setSharedPreferenceValue(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', '');
    Navigator.pushReplacementNamed(context, '/welcome_screen');

  }
}
