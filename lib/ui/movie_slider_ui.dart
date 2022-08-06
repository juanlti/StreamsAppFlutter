import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/constants.dart';
import 'package:up_movi_devep/ui/singMovieUi.dart';

SizedBox Movie_Slider(String categories) {
  return SizedBox(
    width: 100,
    height: 230,
    //color: Colors.blueGrey,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          categories,
          style: textStyle(),
        ),
      ),
      Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 30,
            itemBuilder: ((_, index) {
              return singMovieUi();
            })),
      ),
    ]),
  );
}
