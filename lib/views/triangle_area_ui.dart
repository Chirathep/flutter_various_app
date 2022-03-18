import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TriangleAreaUI extends StatefulWidget {
  const TriangleAreaUI({Key? key}) : super(key: key);

  @override
  State<TriangleAreaUI> createState() => _TriangleAreaUIState();
}

class _TriangleAreaUIState extends State<TriangleAreaUI> {
  TextEditingController _base = TextEditingController(text: '');
  TextEditingController _height = TextEditingController(text: '');

  //
  String result = '0.00';
  showWarningDialog(context, msg) {
//เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

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
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Icon(
                FontAwesomeIcons.exclamationTriangle,
                size: MediaQuery.of(context).size.height * 0.2,
                color: Colors.orange,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: _base,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'ฐาน',
                    labelStyle: TextStyle(
                      fontSize: 19,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.deepOrange,
                    ),
                    hintText: 'ป้อนฐาน',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: _height,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'สูง',
                    labelStyle: TextStyle(
                      fontSize: 19,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.deepOrange,
                    ),
                    hintText: 'ป้อนสูง',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_base.text.isEmpty) {
                        showWarningDialog(context, 'กรุณาป้อนฐาน');
                      } else if (_height.text.isEmpty) {
                        showWarningDialog(context, 'กรุณาป้อนสูง');
                      } else {
                        double base = double.parse(_base.text);
                        double height = double.parse(_height.text);
                        double area = base * height / 2;
                        setState(() {
                          result = area.toStringAsFixed(2);
                        });
                      }
                    },
                    child: Text('คำนวณ'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width - 270, 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //clear
                      setState(() {
                        _base.text = '';
                        _height.text = '';
                        result = '0.00';
                      });
                    },
                    child: Text('ล้าง'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width - 270, 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                result,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
