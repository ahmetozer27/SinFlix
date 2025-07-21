import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class PackageCardWidget extends StatelessWidget {
  const PackageCardWidget({
    super.key,
    required this.discount,
    required this.originalAmount,
    required this.bonusAmount,
    required this.price,
    required this.colors,
  });

  final String discount;
  final String originalAmount;
  final String bonusAmount;
  final String price;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('dokundu : $bonusAmount Jeton');
      },
      child: SizedBox(
        height: ScreenUtils.getScreenHeight(context) * 0.29,
        width: ScreenUtils.getScreenWidth(context) * 0.29,
        child: Stack(
          children: [
            Positioned(
              top: ScreenUtils.getScreenHeight(context) * 0.015,
              child: Container(
                height: ScreenUtils.getScreenHeight(context) * 0.26,
                width: ScreenUtils.getScreenWidth(context) * 0.29,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF66FFFFFF), width: 2),
                ),
                child: Column(
                  children: [
                    const Spacer(
                      flex: 7,
                    ),
                    Text(
                      originalAmount,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15,
                        decoration: TextDecoration.lineThrough, // Üzeri çizili
                      ),
                    ),
                    Text(
                      bonusAmount,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                    const Text(
                      "Jeton",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtils.getScreenWidth(context) * 0.03),
                      child: const Divider(
                        color: Color(0xFF1AFFFFFF),
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 15),
                    ),
                    const Text(
                      "Başına haftalık",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: colors[0],
                    border:
                    Border.all(color: const Color(0xFF66FFFFFF), width: 2)),
                height: ScreenUtils.getScreenHeight(context) * 0.03,
                width: ScreenUtils.getScreenWidth(context) * 0.15,
                child: Center(
                    child: Text(
                      discount,
                      style:
                      const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
