import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_movi_devep/config/auth_provider.dart';
import 'package:up_movi_devep/config/cafe_api.dart';
import 'package:up_movi_devep/config/local_storage.dart';

import 'config/constants.dart';
import 'routes/router.dart';

//final internetChecker = CheckInternetConnection();

void main() async {
  
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final authPovider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>.value(
      value: authPovider,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: apName,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
