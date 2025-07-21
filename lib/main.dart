import 'package:dating_app/app.dart';
import 'package:dating_app/core/config/firebase_config.dart';
import 'package:dating_app/utils/logger_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/config/app_initialize_config.dart';
import 'core/config/bloc_initialize_config.dart';
import 'core/config/localization_initialize_config.dart';

Future<void> initialize() async {
  try {
    await initializeApp();
    await EasyLocalization.ensureInitialized();
    await FirebaseConfig.initializeFirebase();
    //await FirebaseConfig.initializeFirebaseCrashlytics();
    //await FirebaseConfig.initializeFirebaseAnalytics();
    await dotenv.load(fileName: '.env');
    LoggerUtils.logger.i('İnitalize İşlemleri Başarılı!');
  }catch(e){
    LoggerUtils.logger.e('İnitalize İşlemleri Başarısız! Hata:$e');
  }
}

void main() async {
  await initialize();
  LoggerUtils.logger.i('Uygulama Başlatılıyor!');
  runApp(
    const LocalizationInitialize(
      // Dil initialize işlemi
      child: BlocInitialize(
        // State initialize işlemi
        initialLocale: Locale('tr','TR'),
        initialTheme: ThemeMode.dark,
        child: App(),
      ),
    ),
  );
}

