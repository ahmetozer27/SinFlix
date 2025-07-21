import 'package:flutter/material.dart';

class ScreenUtils {

  /// Ekran genişliğini döndüren fonksiyon
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Ekran yüksekliğini döndüren fonksiyon
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

}