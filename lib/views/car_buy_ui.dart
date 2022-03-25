import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CarBuyUI extends StatefulWidget {
  const CarBuyUI({Key? key}) : super(key: key);

  @override
  State<CarBuyUI> createState() => _CarBuyUIState();
}

class _CarBuyUIState extends State<CarBuyUI> {
  TextEditingController _carPrice = TextEditingController(text: '');
  TextEditingController _interestRate = TextEditingController(text: '');
  //
  int downValue = 1;
  //
  String resultD = '0.00';
  String resultF = '0.00';
  String resultM = '0.00';
  //สร้างตัวแปรสำหรับข้อมูลทีี่เอาไปใช้กับ dropdown
  List<DropdownMenuItem<String>> items = [
    '1 ปี (12 งวด)',
    '2 ปี (24 งวด)',
    '3 ปี (36 งวด)',
    '4 ปี (48 งวด)',
    '5 ปี (60 งวด)',
    '6 ปี (72 งวด)',
  ]
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ))
      .toList();
  //เก็บค่าที่เลือกไว้ใน dropdown
  String dropdownValue = '1 ปี (12 งวด)';
  //
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
        backgroundColor: Colors.red,
        title: Text(
          'Car Buy',
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
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: (Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'คำนวณค่างวดรถ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  FontAwesomeIcons.car,
                  color: Color.fromARGB(255, 80, 90, 228),
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width - 80.0,
                  color: Color.fromARGB(255, 187, 59, 59),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ข้อมูลรถ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ราคารถ (บาท)',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    controller: _carPrice,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'เงินดาวน์ (%)',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                  ),
                  child: Row(
                    children: [
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 1,
                        groupValue: downValue,
                        activeColor: Colors.red,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            downValue = 1;
                          });
                        },
                        child: Text(
                          '10%',
                          style: TextStyle(
                            fontSize: 14,
                            color: downValue == 1 ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 2,
                        groupValue: downValue,
                        activeColor: Colors.red,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            downValue = 2;
                          });
                        },
                        child: Text(
                          '20%',
                          style: TextStyle(
                            fontSize: 14,
                            color: downValue == 2 ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 3,
                        groupValue: downValue,
                        activeColor: Colors.red,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            downValue = 3;
                          });
                        },
                        child: Text(
                          '30%',
                          style: TextStyle(
                            fontSize: 14,
                            color: downValue == 3 ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Text('จำนวนปีที่ผ่อน'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: DropdownButton(
                    isExpanded: true,
                    items: items,
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = (value.toString());
                      });
                    },
                    value: dropdownValue,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ดอกเบี้ย (%) ต่อปี',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    controller: _interestRate,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width - 80.0,
                  color: Color.fromARGB(255, 187, 59, 59),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ผลลัพธ์',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //คำนวณผลลัพธ์
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width - 250, 20),
                            primary: Colors.green,
                          ),
                          onPressed: () {
                            double downpay = 0;
                            double fipay = 0;
                            double load = 0;
                            if (_carPrice.text.isEmpty) {
                              showWarningDialog(context, 'กรุณากรอกราคารถ...');
                            } else if (_interestRate.text.isEmpty) {
                              showWarningDialog(
                                  context, 'กรุณากรอกดอกเบี้ย...');
                            } else {
                              //คำนวณเงินดาวน์ = ราคารถ * เงินดาวน์(%)/10
                              if (downValue == 1) {
                                downpay =
                                    double.parse(_carPrice.text) * 10 / 100;
                              } else if (downValue == 2) {
                                downpay =
                                    double.parse(_carPrice.text) * 20 / 100;
                              } else {
                                downpay =
                                    double.parse(_carPrice.text) * 30 / 100;
                              }
                              //คำนวณยอดจัด = ราคารถ - คำนวณเงินดาวน์
                              fipay = double.parse(_carPrice.text) - downpay;
                              //คำนวณค่างวดต่อเดือน = (ราคารถ + (ยอดจัด * ดอกเบี้ย(%)
                              ///100 * จำนวนปี)/จำนวนงวด
                              if (dropdownValue == '1 ปี (12 งวด)') {
                                double cp = double.parse(_carPrice.text);
                                double itr = double.parse(_interestRate.text);
                                load = (cp + (fipay * itr / 100 * 1)) / 12;
                              } else if (dropdownValue == '2 ปี (24 งวด)') {
                                double cp = double.parse(_carPrice.text);
                                double itr = double.parse(_interestRate.text);
                                load = (cp + (fipay * itr / 100 * 2)) / 24;
                              } else if (dropdownValue == '3 ปี (36 งวด)') {
                                double cp = double.parse(_carPrice.text);
                                double itr = double.parse(_interestRate.text);
                                load = (cp + (fipay * itr / 100 * 3)) / 36;
                              } else if (dropdownValue == '4 ปี (48 งวด)') {
                                double cp = double.parse(_carPrice.text);
                                double itr = double.parse(_interestRate.text);
                                load = (cp + (fipay * itr / 100 * 4)) / 48;
                              } else if (dropdownValue == '5 ปี (60 งวด)') {
                                double cp = double.parse(_carPrice.text);
                                double itr = double.parse(_interestRate.text);
                                load = (cp + (fipay * itr / 100 * 5)) / 60;
                              } else {
                                double cp = double.parse(_carPrice.text);
                                double itr = double.parse(_interestRate.text);
                                load = (cp + (fipay * itr / 100 * 6)) / 72;
                              }
                              setState(() {
                                var fm = NumberFormat("#,###,###.00");
                                resultF = fm.format(fipay);
                                resultM = fm.format(load);
                                resultD = fm.format(downpay);
                              });
                            }
                          },
                          child: Text(
                            'คำนวณ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      //ปุ่มรีเซ็ต
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width - 250, 20),
                            primary: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              setState(() {
                                _interestRate.text = '';
                                _carPrice.text = '';
                                dropdownValue = '1 ปี (12 งวด)';
                                resultD = '0.00';
                                resultF = '0.00';
                                resultM = '0.00';
                                downValue = 1;
                              });
                            });
                          },
                          child: Text(
                            'รีเซ็ต',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'เงินดาวน์ (บาท)',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Text(
                        resultD,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ยอดจัดไฟแนนซ์ (บาท)',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Text(
                        resultF,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ค่างวดต่อเดือน (บาท)',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Text(
                        resultM,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
