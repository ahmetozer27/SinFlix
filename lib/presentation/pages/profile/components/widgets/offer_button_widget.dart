
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../utils/screen_utils.dart';

class OfferButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const OfferButtonWidget({
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
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          children: [
            const Icon(Icons.diamond,size: 16,),
            SizedBox(width: ScreenUtils.getScreenWidth(context) *0.01,),
            const Text('Sınırlı Teklif',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600
            ),),
          ],
        ),
      ),
    );
  }
}