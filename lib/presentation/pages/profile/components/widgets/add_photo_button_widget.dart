
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class AddPhotoButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const AddPhotoButtonWidget({
    super.key,
    required this.onTap
  });



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.primaryRed,
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text('Fotoğraf Ekle',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),),
        ),
      ),
    );
  }
}