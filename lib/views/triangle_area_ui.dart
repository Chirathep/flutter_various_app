import 'package:flutter/material.dart';

class TriangleAreaUI extends StatefulWidget {
  const TriangleAreaUI({Key? key}) : super(key: key);

  @override
  State<TriangleAreaUI> createState() => _TriangleAreaUIState();
}

class _TriangleAreaUIState extends State<TriangleAreaUI> {
  @override
  Widget build(BuildContext context) {
    // ignore:
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Triangle Area'),
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
