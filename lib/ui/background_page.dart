import 'dart:math';

import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/constants.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  //color de fondo
  final boxDecoration = const BoxDecoration(
    color: backGround,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //color azul del background
            Container(decoration: boxDecoration),

            Positioned(
              top: -72,
              left: -81,
              child: _PinkBoxCircul(),
            ),

            Positioned(
              top: 219,
              left: 239,
              child: Transform.rotate(
                angle: -pi / 10.0,
                child: ClipOval(child: _PinkBox()),
              ),
            ),

            Positioned(
              top: 559,
              left: -207,
              child: Transform.rotate(
                angle: pi / 10.0,
                child: ClipOval(child: _PinkBox2()),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _PinkBoxCircul extends StatelessWidget {
  const _PinkBoxCircul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const RadialGradient(colors: [
          Color.fromRGBO(213, 0, 85, 0.32),
          Color.fromRGBO(213, 0, 85, 0),
        ]),
      ),
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: 403,
        height: 205,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(100),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(213, 0, 85, 0),
            Color.fromRGBO(213, 0, 85, 0.52),
          ]),
        ),
      ),
    );
  }
}

class _PinkBox2 extends StatelessWidget {
  const _PinkBox2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: 403,
        height: 205,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(100),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(213, 0, 85, 0.52),
            Color.fromRGBO(213, 0, 85, 0),
          ]),
        ),
      ),
    );
  }
}
