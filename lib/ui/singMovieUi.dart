import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/constants.dart';

//icono + titulo + corazon
Widget singMovieUi(BuildContext context, String titulo, int i) {
  return GestureDetector(
    onTap: () {
      print('estoy en una pelicula');
    },
    child: Container(
      width: 90,
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  fit: BoxFit.cover,
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
                  titulo ?? 'The Umbrella Academy id? ${i}',
                  style: textStyle(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(flex: 1, child: customIcons(IconHeart))
            ],
          ),
        ],
      ),
    ),
  );
}
