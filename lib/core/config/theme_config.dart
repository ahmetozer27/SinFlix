import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData get lightTheme {
    final base = ThemeData.light();
    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: 'EuclidCircularA',
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground
      )
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: 'EuclidCircularA',
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundDark
        )
    );
  }
}
