import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_movi_devep/ui/buttomUi.dart';

import 'package:up_movi_devep/config/constants.dart';

import 'package:up_movi_devep/ui/textIputUI_white.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formLogin = GlobalKey<FormState>();

    final _email = TextEditingController();
    final _password = TextEditingController();
    //SingleChildScrollView
    return Center(
        child: Center(
      child: Form(
        //README ALL DATA FOR TO CHANGE
        key: formLogin,

        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 60)),
            InputField(widthInpuField, _email, _password),
            helpPassword(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // datos de email y password ya controlados,luego se confirma en el backUp
                buttomUi(
                    onPressed: () async {
                      if (formLogin.currentState?.validate() == true) {
                        email:
                        _email.toString();
                        password:
                        _password.toString();
                        //Navigator.pushReplacementNamed(context, '/app/3');
                        //context.go('/app/${1}');
                        context.go('/app/${'0'}');

                        print(
                            'paso previo a query ${formLogin.currentState?.validate()}');
                      }
                      print('estoy adentro');
                    },
                    typeLabel: 'Acceder'),
                buttomUi(
                    onPressed: () async {
                      if (formLogin.currentState?.validate() == true) {
                        email:
                        _email.toString();
                        password:
                        _password.toString();
                      }
                    },
                    typeLabel: 'Registrar'),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Padding helpPassword() {
    return Padding(
      padding: EdgeInsets.only(left: 190),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {},
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: textStyle(),
        ),
      ),
    );
  }

  Container InputField(widthInpuField, TextEditingController _email,
      TextEditingController _password) {
    return Container(
      decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),

      //FALTA COLOR
      height: 190,
      width: widthInpuField,

      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        // unSizeBox('Usuario'),

        unSizeBox('Usuario'),
        InputEmail(_email),
        unSizeBox('Contraseña'),
        InputPassword(_password),
      ]),
    );
  }

  TextIputUI InputPassword(TextEditingController passwordController) {
    return TextIputUI(
      placeholder: 'xxxxxx',
      controller: passwordController,
      password: true,
      onValidate: (value) {
        print('estoy en el inputPassword ${value}');
        if (value.length == 0) {
          return 'Please enter password';
        }
        return null;
      },
    );
  }

  TextIputUI InputEmail(TextEditingController emailController) {
    return TextIputUI(
      placeholder: 'ejemplo@gmail.com',
      controller: emailController,
      onValidate: (value) {
        print('estoy en el inputEmail ${value}');
        if (!EmailValidator.validate(value ?? '')) {
          return 'EmaiL wrong';
        }
        return null;
      },
    );
  }

  SizedBox unSizeBox(String unInputHelp) {
    return SizedBox(
      height: 20,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '$unInputHelp',
          style: textStyle(),
        ),
      ),
      width: 300,
    );
  }
}
