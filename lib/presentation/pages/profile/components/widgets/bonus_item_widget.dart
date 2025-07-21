import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class BonusItemWidget extends StatelessWidget {
  const BonusItemWidget({
    super.key,
    required this.photoPath,
    required this.text,
  });

  final String photoPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print('dokundu : $text');
          },
          child: Container(
            width: ScreenUtils.getScreenWidth(context) * 0.15,
            height: ScreenUtils.getScreenWidth(context) * 0.15,
            decoration: BoxDecoration(
              color: const Color(0xFF6F060B),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF66FFFFFF), width: 3),
            ),
            child: Image.asset(
              photoPath,
            ),
          ),
        ),
        SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.02),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            height: 1.2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
