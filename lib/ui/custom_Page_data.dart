import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/constants.dart';

import 'package:up_movi_devep/ui/textIputUI_white.dart';

Widget CustomPageData() {
  final GlobalKey<FormState> formLogin = GlobalKey<FormState>();

  final _editar = TextEditingController();
  final _password = TextEditingController();
  final Text aData = Text(
    'unDato',
    style: textStyle(),
  );
  bool isPassword = false;
  return SizedBox(
    width: 350,
    child: Wrap(spacing: 10, runSpacing: 15, children: [
      InputData(_editar, IconsButton(IconUser), aData, isPassword),
      InputData(_editar, IconsButton(IconEmail), aData, isPassword),
      InputData(_editar, IconsButton(IconPhone), aData, isPassword),
      InputData(_editar, IconsButton(IconLock), aData, true),
      InputData(_editar, IconsButton(IconPhone), aData, isPassword),
      OutlinedButton(onPressed: () {}, child: Text('editar')),
    ]),
  );
}

TextIputUI InputData(TextEditingController passwordController,
    Widget PrefixIcon, Text placeHolder, bool isPassword) {
  return TextIputUI(
    password: isPassword,
    placeholder: '${placeHolder.toString()}',
    controller: passwordController,
    prefixIcon: PrefixIcon,
    isRed: true,
    onValidate: (value) {
      print('estoy en el inputPassword ${value}');
      if (value.length == 0) {
        return 'Please enter password';
      }
      return null;
    },
  );
}
/*
      //avatar
      //nombre y apellido + email
      Row(
        children: [Icon(Icons.people), Text('perfil')],
      ),

*/