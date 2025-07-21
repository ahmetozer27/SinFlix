import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit(super.initialLocale);

  // Dil değişimini tek bir fonksiyona almak
  void setLanguage(BuildContext context, String languageCode, String countryCode) {

    // EasyLocalization'ı güncelle
    context.setLocale(Locale(languageCode, countryCode));

    // State'i güncelle
    emit(Locale(languageCode, countryCode));
  }

}