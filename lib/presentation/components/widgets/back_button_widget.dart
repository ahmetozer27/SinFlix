import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const BackButtonWidget({super.key,required this.onPressed});

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
        icon: const Icon(Icons.arrow_back,color: Colors.white,),
        style: IconButton.styleFrom(),
      ),
    );
  }
}
