import 'package:flutter/material.dart';


import 'package:up_movi_devep/config/constants.dart';
import 'package:up_movi_devep/routes/navegacionRouter.dart';


import 'package:provider/provider.dart';
import 'package:up_movi_devep/ui/logo.dart';
import 'package:up_movi_devep/ui/movie_slider_ui.dart';

//home == app
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final navegacionRouter = Provider.of<NavegacionMovel>;

  int indexPage = 0;

  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Logo(200),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            autofocus: true,
            style: textStyle(),
            decoration: InputDecoration(
              prefixIcon: customIcons(IconSearch),
              suffixIcon: customIcons(IconMicrophone),
            ),
          ),
        ),
        Movie_Slider('Movie'),
        Movie_Slider('Series'),
        Movie_Slider('Tv online'),
        Movie_Slider('News'),
        Movie_Slider('Others'),
      ]),
    );
  }
}
