import 'package:flutter/material.dart';

class TemperatureUI extends StatefulWidget {
  const TemperatureUI({Key? key}) : super(key: key);

  @override
  State<TemperatureUI> createState() => _TemperatureUIState();
}

class _TemperatureUIState extends State<TemperatureUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Temperature',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          //คำสั่งกลับไปหน้าก่อนหน้า
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
