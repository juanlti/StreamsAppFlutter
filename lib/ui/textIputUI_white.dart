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
  }) : super(key: key);

  final String placeholder;
  final TextEditingController controller;
  final bool? password;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onChange;

  final Function? onValidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
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
