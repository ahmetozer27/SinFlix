import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    super.key,
    required this.icon,
  });

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: (){},
      child: Container(
        width: ScreenUtils.getScreenWidth(context) * 0.18,
        height: ScreenUtils.getScreenHeight(context) * 0.09,
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.inputBorder,
            width: 1,
          )
        ),
        child: Center(
          child: FaIcon(icon),
        ),
      ),
    );
  }
}
