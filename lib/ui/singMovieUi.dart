import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/constants.dart';

//icono + titulo + corazon
Widget singMovieUi() {
  return Container(
    width: 90,
    height: 140,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            //ver pelicula
            null;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                fit: BoxFit.cover,
                height: 125,
                width: double.infinity,
                placeholder: AssetImage(IconNoImage),
                image: NetworkImage('https://via.placeholder.com/300x400')),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Text(
                'The Umbrella Academy',
                style: textStyle(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
                flex: 1,
                child:
                    IconButton(onPressed: () {}, icon: customIcons(IconHeart)))
          ],
        ),
      ],
    ),
  );
}
