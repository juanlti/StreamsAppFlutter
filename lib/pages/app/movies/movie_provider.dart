import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final _listMovies = ['peli01','peli02','peli03','peli04'];
  

  List<dynamic> get movie {
    return [..._listMovies];
  }



}
