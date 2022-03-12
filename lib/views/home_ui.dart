import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_various_app/views/car_buy_ui.dart';
import 'package:flutter_various_app/views/temperature_ui.dart';
import 'package:flutter_various_app/views/triangle_area_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Various App',
              ),
              accountEmail: Text(
                'SAU : Southeast Asia University',
              ),
              decoration: BoxDecoration(
                color: Colors.green[400],
              ),
              currentAccountPicture: Image.asset(
                'assets/images/banner.png',
              ),
              otherAccountsPictures: [
                Image.network(
                  'https://icons.iconarchive.com/icons/iconka/meow-2/256/cat-paper-icon.png',
                ),
                Image.network(
                  'https://www.sau.ac.th/images/logo.png',
                ),
              ],
            ),
            ListTile(
              //คำสั่งยุบ drawer
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TemperatureUI()));
              },

              title: Text(
                'Temperature Conventor',
                style: TextStyle(
                  color: Colors.grey[850],
                  // fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.temperatureHigh,
                color: Colors.red,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TriangleAreaUI()));
              },
              title: Text(
                'Triangle Area',
                style: TextStyle(
                  color: Colors.grey[850],
                  // fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.exclamationTriangle,
                color: Colors.blue[300],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CarBuyUI()));
              },
              title: Text(
                'Carbuy',
                style: TextStyle(
                  color: Colors.grey[850],
                  // fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.car,
                color: Colors.orange[600],
              ),
            ),
            Expanded(
              child: Text(
                '',
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                //คำสั่งปิดแอปพลิเคชัน
                exit(0);
              },
              title: Text(
                'ออกจากแอปพลิเคชัน',
                style: TextStyle(
                  color: Colors.grey[850],
                  // fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.grey[700],
              ),
            ),
            Divider(),
          ],
        ),
      ),
      // endDrawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TemperatureUI()));
              },
              icon: Icon(FontAwesomeIcons.temperatureHigh),
              label: Text(
                'Go to Temperature Converter',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                fixedSize: Size(MediaQuery.of(context).size.width - 80.0, 50.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TriangleAreaUI()));
              },
              icon: Icon(FontAwesomeIcons.exclamationTriangle),
              label: Text(
                'Go to Triangle Area',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: Size(MediaQuery.of(context).size.width - 80.0, 50.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CarBuyUI()));
              },
              icon: Icon(FontAwesomeIcons.car),
              label: Text(
                'Go to Carbuy',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                fixedSize: Size(MediaQuery.of(context).size.width - 80.0, 50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
