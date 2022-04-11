import 'package:flutter/material.dart';

class Appbars extends StatefulWidget {
  Appbars({Key? key}) : super(key: key);

  @override
  State<Appbars> createState() => _AppbarsState();
}

class _AppbarsState extends State<Appbars> {
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Clock",
            style: TextStyle(
                color: Color(0xFF37496A),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: we * 0.54),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffE3EDF7),
                boxShadow: [
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
                ]),
            child: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
