import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([ /// Yatay Modu Kapatmak İçin
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}