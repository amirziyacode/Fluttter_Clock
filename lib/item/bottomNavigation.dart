import 'package:clocker/page/home.dart';
import 'package:clocker/page/timer.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class Bottome extends StatefulWidget {
  int pageIndex;
  Bottome({Key? key, required this.pageIndex}) : super(key: key);

  @override
  _BottomeState createState() => _BottomeState();
}

class _BottomeState extends State<Bottome> {
  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return SizedBox(
      width: we * 0.2,
      height: he * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(PageTransition(child: MyHomePage(), type: PageTransitionType.fade,));
              },
              child: items(
                  icon: Icons.schedule_outlined,
                  isOn: widget.pageIndex == 1 ? false : true)),
          SizedBox(
            width: we * 0.1,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(PageTransition(
                    child: const Timers(), type: PageTransitionType.fade));
              },
              child: items(
                  icon: Icons.timer_outlined,
                  isOn: widget.pageIndex == 2 ? false : true)),
          SizedBox(
            width: we * 0.1,
          ),
          InkWell(
              onTap: () {
                setState(() {
                });
              },
              child: items(
                  icon: Icons.alarm_outlined,
                  isOn: widget.pageIndex == 3 ? false : true)),
          SizedBox(
            width: we * 0.1,
          ),
          InkWell(
              onTap: () {
                setState(() {
                });
              },
              child: items(
                  icon: Icons.more_time_outlined,
                  isOn: widget.pageIndex == 4 ? false : true)),
        ],
      ),
    );
  }
}

class items extends StatelessWidget {
  bool isOn;
  IconData icon;
  items({Key? key, required this.isOn, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 45,
      height: 45,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffE3EDF7),
          boxShadow: isOn
              ? [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(2, 2),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: Offset(-2, -2),
                  ),
                ]
              : null),
      child: Icon(
        icon,
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
