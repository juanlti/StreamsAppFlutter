import 'package:flutter/material.dart';
import 'package:up_movi_devep/ui/movie_slider_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Movie_Slider(context, 'Movie'),
        Movie_Slider(context, 'Series'),
        Movie_Slider(context, 'TvOnline'),
        Movie_Slider(context, 'Others'),
      ],
    );
  }
}
