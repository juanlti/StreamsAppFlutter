import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/constants.dart';

import 'package:up_movi_devep/pages/login/login_page.dart';
import 'package:up_movi_devep/ui/background_page.dart';

import 'package:up_movi_devep/ui/logo.dart';

class GuestLayout extends StatelessWidget {
  final Widget child;
  const GuestLayout({Key? key, required this.child}) : super(key: key);
// ES INGRESO O REGISTRO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGround,
        body: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Stack(children: [
              Positioned(width: 300, top: 300, child: Background()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Logo(200),
                  child
                  //LoginPage(),
                ],
              ),
            ]),
          ),
        ));
  }
}

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

          print('accion del field ${value}');
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
