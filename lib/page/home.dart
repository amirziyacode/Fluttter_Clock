import 'package:clocker/item/appbar.dart';
import 'package:clocker/item/bottomNavigation.dart';
import 'package:clocker/item/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool status = true;
  bool statu1 = false;


  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color(0xffE3EDF7),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Appbars(),
                SizedBox(height: he * 0.05),
                const ClockView(),
                SizedBox(
                  height: he * 0.05,
                ),
                Container(
                  width: we * 0.84,
                  height: he * 0.07,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffE3EDF7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(4, 4),
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: Offset(-4, -4),
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "5:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: we * 0.01,
                      ),
                      const Text(
                        "am",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: we * 0.4,
                      ),
                    FlutterSwitch(
                          value: statu1,
                          activeColor: Colors.black,
                          onToggle: (value) {
                           setState(() {
                             statu1 = value;
                           });
                          })
                    ],
                  ),
                ),
                SizedBox(
                  height: he * 0.04,
                ),
                Container(
                  width: we * 0.84,
                  height: he * 0.07,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffE3EDF7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(4, 4),
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: Offset(-4, -4),
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "6:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: we * 0.01,
                      ),
                      const Text(
                        "am",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: we * 0.4,
                      ),
                      FlutterSwitch(
                          value: status,
                          activeColor: Colors.black,
                          onToggle: (value) {
                           setState(() {
                             status = value;
                           });
                          })
                    ],
                  ),
                )
              ],
            )),
        bottomNavigationBar:  Bottome(pageIndex: 1,));
  }
}
