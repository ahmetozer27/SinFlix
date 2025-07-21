import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constants/app_colors.dart';

class SignOutWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const SignOutWidget({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.inputBorder, width: 1),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket,color: Colors.white,),
        style: IconButton.styleFrom(),
      ),
    );
  }
}