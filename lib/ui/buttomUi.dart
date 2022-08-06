import 'package:flutter/material.dart';

import '../config/constants.dart';

SizedBox buttomUi({
  required Function onPressed,
  required String typeLabel,
  Color? backGround,
}) {
  return SizedBox(
    width: 150,
    height: 45,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(width: 3.5, color: primaryColor),
      ),
      onPressed: () {
        //Navigator.pushNamed(context, 'loading');

        // FocusScope.of(context).requestFocus(FocusNode());
        return onPressed();
      },
      child: Text(
        '$typeLabel',
        style: textStyle(),
      ),
    ),
  );
}

class CustomCircleItemPainter extends CustomPainter {
  final double progress;

  CustomCircleItemPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 20.0 * this.progress;
    final strokeWidth = 10.0;
    final currentStrokeWidth = strokeWidth * (1 - this.progress);
    if (this.progress < 1.0) {
      canvas.drawCircle(
          center,
          radius,
          Paint()
            ..color = Color(0xFF131031)
            ..style = PaintingStyle.stroke
            ..strokeWidth = currentStrokeWidth);
    }
  }

  @override
  bool shouldRepaint(CustomCircleItemPainter oldDelegate) => true;
/*
  @override
  bool shouldRepaint(CustomCircleItemPainter oldDelegate) =>
      oldDelegate.progress != progress;


      */
}
