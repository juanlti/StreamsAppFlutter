import 'package:flutter/material.dart';

class LoginModel extends StatelessWidget {
  const LoginModel({Key? key, required this.user, required this.password
      //attributes
//control
      })
      : super(key: key);

  final String user;
  final String password;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: true,
      onChanged: (value) {
        print('valor ingresado $value');
      },
    );
  }
}
