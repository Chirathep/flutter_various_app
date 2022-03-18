import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemperatureUI extends StatefulWidget {
  const TemperatureUI({Key? key}) : super(key: key);

  @override
  State<TemperatureUI> createState() => _TemperatureUIState();
}

class _TemperatureUIState extends State<TemperatureUI> {
  TextEditingController _temp = TextEditingController(text: '');
  //
  int tempGroup = 1;
  //ตัวแปร
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
      body: GestureDetector(
        // onTap: () => FocusScope.of(context).unfocus(),
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                Icon(
                  FontAwesomeIcons.temperatureHigh,
                  size: 80,
                  color: Color.fromARGB(255, 150, 137, 26),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: _temp,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'อุณหภูมิ',
                      labelStyle: TextStyle(
                        fontSize: 19,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Color.fromARGB(255, 150, 137, 26),
                      ),
                      hintText: 'ป้อนอุณหภูมิ (cel หรือ fah)',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 150, 137, 26),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
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
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        tempGroup = 1;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          //สร้างปุ่มกดเลือกรูปแบบอุณหภูมิ
                          value: 1,
                          groupValue: tempGroup,
                          onChanged: (value) {
                            setState(() {
                              tempGroup = 1;
                            });
                          },
                          activeColor: Color.fromARGB(255, 216, 203, 81),
                        ),
                        Text(
                          'แปลง Fahrenheit เป็น Celcius',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        tempGroup = 2;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          //สร้างปุ่มกดเลือกรูปแบบอุณหภูมิ
                          value: 2,
                          groupValue: tempGroup,
                          onChanged: (value) {
                            setState(() {
                              tempGroup = int.parse(value.toString());
                            });
                          },
                          activeColor: Color.fromARGB(255, 216, 203, 81),
                        ),
                        Text(
                          'แปลง Fahrenheit เป็น Celcius',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  //สร้างปุ่มคำนวณ
                  onPressed: () {
                    //algorythm+logic
                    if (_temp.text.isEmpty) {
                      showWarningDialog(context, 'กรุณาป้อนอุณหภูมิ');
                    } else {
                      if (tempGroup == 1) {
                        //calculate celcius to fahrenheit สูตร f = (9/5)*c + 32
                        setState(() {
                          double c = double.parse(_temp.text);
                          double f = (9 / 5) * c + 32;
                          result = f.toStringAsFixed(2);
                        });
                      } else {
                        //calculate fahrenheit to celcius สูตร c = (f - 32) * 5/9
                        setState(() {
                          double f = double.parse(_temp.text);
                          double c = (f - 32) * 5 / 9;
                          result = c.toStringAsFixed(2);
                        });
                      }
                    }
                  },

                  child: Text('คำนวณ'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 196, 179, 33),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width - 100, 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 163, 154, 85),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
