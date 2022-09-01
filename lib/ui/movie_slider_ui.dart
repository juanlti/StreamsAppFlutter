import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/constants.dart';
import 'package:up_movi_devep/ui/singMovieUi.dart';

Container Movie_Slider(BuildContext context, String categories) {
  return Container(
    width: double.infinity,
    color: backGround,
    height: 250,

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
              return 
              
              singMovieUi(context, 'Transformers ${index}', index);
            })),
      ),
    ]),
  );
}
