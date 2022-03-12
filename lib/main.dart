import 'package:flutter/material.dart';
import 'package:flutter_various_app/views/home_ui.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}
