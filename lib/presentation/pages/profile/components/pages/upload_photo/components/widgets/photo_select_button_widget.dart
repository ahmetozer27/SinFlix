import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class PhotoSelectButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const PhotoSelectButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32),
      child: Container(
        width: ScreenUtils.getScreenHeight(context) * 0.2,
        height: ScreenUtils.getScreenHeight(context) * 0.2,
        decoration: BoxDecoration(
          color: AppColors.inputBackground, // arka plan rengi
          borderRadius: BorderRadius.circular(32), // köşe yumuşaklığı
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: ScreenUtils.getScreenWidth(context)*0.1,
            color: AppColors.textMini,
          ),
        ),
      ),
    );
  }
}
