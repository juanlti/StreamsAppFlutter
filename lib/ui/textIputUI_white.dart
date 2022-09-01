import 'package:flutter/material.dart';

import 'package:up_movi_devep/config/constants.dart';

class TextIputUI extends StatelessWidget {
  const TextIputUI({
    Key? key,
    required this.placeholder,
    required this.controller,
    this.onValidate,
    this.onChange,
    this.password,
    this.prefixIcon,
    this.suffixIcon,
     this.isRed, 
  }) : super(key: key);

  final String placeholder;
  final TextEditingController controller;
  final bool? password;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onChange;
  final bool? isRed;
  final Function? onValidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:isRed!? BoxDecoration(
          border: Border.all(
            color: primaryColor,
            width: 2.0,
          ),
          gradient:const LinearGradient(colors: [
            Color(0xffD50055),
            Color(0xff131031),
          ]),
          borderRadius:const BorderRadius.all(
            Radius.circular(5),
          )): const BoxDecoration(
          color:Colors.white,
          //cambiar por color degrade
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      width: 300,
      child: TextFormField(
    
        style: TextStyle(fontSize: 20),
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
      
          prefixIcon: prefixIcon,
          filled: true,
          hintText: placeholder,
        ),
        controller: controller,
        validator: (value) => onValidate!(value),
        onChanged: (value) {
          //show results

          //print('accion del field ${value}');
        },
      ),
    );
  }

  IconData isPassword(bool password) {
    if (password) {
      return visibilityLogin;
    } else {
      return visibility_offLogin;
    }
  }
}
