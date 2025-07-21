import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../utils/screen_utils.dart';
import '../widgets/bonus_item_widget.dart';
import '../widgets/package_card_widget.dart';

class SpecialOfferBottomSheet extends StatelessWidget {
  const SpecialOfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getScreenHeight(context) * 0.8,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.8), // Yukarı kaydırır
          colors: [
            Color(0xFF6F060B),
            AppColors.backgroundDark,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtils.getScreenHeight(context) * 0.035,
          ),
          const Text(
            'Sınırlı Teklif',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
          ),
          SizedBox(
            height: ScreenUtils.getScreenHeight(context) * 0.01,
          ),
          Text(
            'Jeton paketini seçerek bonus\nkazanın ve yeni bölümlerin kilidini açın!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.w400),
            maxLines: 2,
          ),
          SizedBox(
            height: ScreenUtils.getScreenHeight(context) * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: ScreenUtils.getScreenHeight(context) * 0.22,
              decoration: BoxDecoration(
                  gradient: const RadialGradient(
                    center: Alignment.center,
                    radius: 1,
                    colors: [
                      Color(0xFF1AFFFFFF),
                      Color(0xFF08FFFFFF),
                    ],
                  ),
                  border: Border.all(color: AppColors.inputBorder, width: 1),
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Alacağınız Bonuslar",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  SizedBox(
                    height: ScreenUtils.getScreenHeight(context) * 0.02,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BonusItemWidget(
                          photoPath: "lib/resources/assets/images/crystal.png",
                          text: 'Premium\nHesap'),
                      BonusItemWidget(
                          photoPath:
                          "lib/resources/assets/images/double_heart.png",
                          text: 'Daha\nFazla Eşleşme'),
                      BonusItemWidget(
                          photoPath: "lib/resources/assets/images/up.png",
                          text: 'Öne\nÇıkarma'),
                      BonusItemWidget(
                          photoPath: "lib/resources/assets/images/heart.png",
                          text: 'Daha\nFazla Beğeni'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtils.getScreenHeight(context) * 0.02,
          ),
          const Text(
            'Kilidi açmak için bir jeton paketi seçin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
          ),
          SizedBox(
            height: ScreenUtils.getScreenHeight(context) * 0.02,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PackageCardWidget(
                  discount: '+10%',
                  originalAmount: '200',
                  bonusAmount: '330',
                  price: '\$99,99',
                  colors: [Color(0xFF6F060B), Color(0xFFE50914)]),
              PackageCardWidget(
                  discount: '+70%',
                  originalAmount: '2.000',
                  bonusAmount: '3.375',
                  price: '\$799,99',
                  colors: [Color(0xFF5949E6), Color(0xFFE50914)]),
              PackageCardWidget(
                  discount: '+35%',
                  originalAmount: '1.000',
                  bonusAmount: '1.350',
                  price: '\$399,99',
                  colors: [Color(0xFF6F060B), Color(0xFFE50914)]),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenUtils.getScreenHeight(context) * 0.005,
                horizontal: ScreenUtils.getScreenWidth(context) * 0.02),
            child: SizedBox(
              width: double.infinity,
              height: ScreenUtils.getScreenHeight(context) * 0.07,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Tüm Jetonları Gör',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
