import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_movi_devep/ui/buttomUi.dart';

import 'package:up_movi_devep/config/constants.dart';
import 'package:up_movi_devep/ui/textIputUI_white.dart';

import '../../../ui/logo.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formLogin = GlobalKey<FormState>();
    final _email = TextEditingController();
    final _password = TextEditingController();
    final _user = TextEditingController();
    final _numberPhone = TextEditingController();

    return SingleChildScrollView(
      child: Form(
        //README ALL DATA FOR TO CHANGE
        key: formLogin,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            InputField(widthInpuField, _email, _password, _user, _numberPhone),
            Padding(
              padding: EdgeInsets.only(
                right: 60,
              ),
              child: Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            null;
                          },
                          icon: SvgPicture.asset(IconCheckBox)),
                      Text(
                        'acepto Terminos y Condiciones',
                        style: textStyle(),
                      ),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              child: buttomUi(
                  typeLabel: 'Crear Cuenta',
                  onPressed: () async {
                    if (formLogin.currentState?.validate() == true) {
                      //valores ya verificados, deben ser correctos !
                      email:
                      _email.toString();
                      password:
                      _password.toString();
                      user:
                      _user.toString();
                      phone:
                      _numberPhone.toString();
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                'o registrar con',
                style: textStyle(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: customIcons(IconGoogle)),
                  IconButton(onPressed: () {}, icon: customIcons(IconFacebook)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container InputField(
      double widthInpuField,
      TextEditingController _emailController,
      TextEditingController _passwordController,
      TextEditingController _userController,
      TextEditingController _numberPhoneController) {
    return Container(
      decoration: BoxDecoration(
          color: backInput,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),

      //FALTA COLOR
      //widthPhone=450
      //widthDeskot=1000,
      padding: EdgeInsets.all(40),
      height: 350,
      width: 500,

      child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          direction: Axis.vertical,
          spacing: 15,
          children: [
            //falta agregar los iconos

            TextIputUI(
              placeholder: 'usuario',
              controller: _userController,
              prefixIcon: customIcons(IconUser),
              isRed: false,
            ),

            TextIputUI(
              placeholder: 'correo',
              controller: _emailController,
              prefixIcon: customIcons(IconEmail),
              isRed: false,
            ),

            TextIputUI(
              placeholder: 'celular',
              controller: _numberPhoneController,
              prefixIcon: customIcons(IconPhone),
              isRed: false,
            ),

            TextIputUI(
              placeholder: 'contraseña',
              controller: _passwordController,
              prefixIcon: customIcons(IconLock),
              isRed: false,
            
            ),
          ]),
    );
  }
}
