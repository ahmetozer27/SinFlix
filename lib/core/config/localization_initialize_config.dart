import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationInitialize extends StatelessWidget {
  final Widget child;
  const LocalizationInitialize({super.key, required this.child});

  static List<Locale> supportedLocalesList = const [
    Locale('en', 'US'),  // Amerikan İngilizcesi
    Locale('tr', 'TR'),  // Türkiye Türkçesi
  ];

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
        supportedLocales: supportedLocalesList,
        path: 'lib/resources/translations', // <-- Translation path
        startLocale: const Locale('tr', 'TR'),  // Burada başlatabilirsin
        fallbackLocale: const Locale('en', 'US'),
        useOnlyLangCode: false, // Ülke kodunu da kullan
        child: child);
  }
}