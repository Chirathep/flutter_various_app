import 'package:flutter/material.dart';
import 'package:flutter_various_app/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeUI()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/banner.png',
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            SizedBox(height: 20),
            Text(
              'SAU VARIOUS APP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
