import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          constraints: const BoxConstraints.expand(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xffE3EDF7),
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                  colors: [Color(0xffecf6ff), Color(0xffcadbeb)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 32,
                  spreadRadius: 1,
                  offset: const Offset(30, 20),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 32,
                  spreadRadius: 1,
                  offset: Offset(-20, -10),
                ),
              ]),
        ),
        Container(
          width: 140,
          height: 140,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffE3EDF7),
              gradient: const LinearGradient(
                  colors: [Color(0xffecf6ff), Color(0xffcadbeb)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 32,
                  spreadRadius: 1,
                  offset: const Offset(30, 20),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 32,
                  spreadRadius: 1,
                  offset: Offset(-20, -10),
                ),
              ]),
        ),
        Container(
          constraints: BoxConstraints.expand(),
          child: Transform.rotate(
              angle: -pi / 2, child: CustomPaint(painter: ClockPainter())),
        )
      ]),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var datatime = DateTime.now();

    var centerx = size.width / 2;
    var centery = size.height / 2;
    var center = Offset(centerx, centery);
    var radius = min(centerx, centery);
    var outerRadius = radius - 20;
    var innerRadius = radius - 30;

    var hourDashPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 180; i += 45) {
      double x1 = centerx - outerRadius * cos(i * pi / 90);
      double y1 = centerx - outerRadius * sin(i * pi / 90);
      double x2 = centerx - innerRadius * cos(i * pi / 90);
      double y2 = centerx - innerRadius * sin(i * pi / 90);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourDashPaint);
    }

    var secHandBrush = Paint()
      ..color = Colors.red[500]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var secHandX = centerx + 130 * cos(datatime.second * 6 * pi / 180);
    var secHandY = centerx + 130 * sin(datatime.second * 6 * pi / 180);

    var minHandBrush = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var minHandX = centerx + 100 * cos(datatime.minute * 6 * pi / 180);
    var minHandY = centerx + 100 * sin(datatime.minute * 6 * pi / 180);

    var houHandBrush = Paint()
      ..color = Colors.blue[500]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;
    var houHandX = centerx +
        60 * cos((datatime.hour * 30 + datatime.minute * 0.5) * pi / 180);
    var houHandY = centerx +
        60 * sin((datatime.hour * 30 + datatime.minute * 0.5) * pi / 180);

    var dashBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(houHandX, houHandY), houHandBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
