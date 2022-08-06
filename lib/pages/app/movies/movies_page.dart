import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/constants.dart';


class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);



// llamado al backEnd y llamamos al widget list_Videos (para que muestre los videos)
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 200,
      width: 200,
      
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        width: 200,
        child: TextFormField(
          autofocus: true,
          style: textStyle(),
          decoration: InputDecoration(
            prefixIcon: customIcons(IconSearch),
            suffixIcon: customIcons(IconMicrophone),
          ),
        ),
      ),
    );
  }
}
