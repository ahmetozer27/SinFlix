import 'package:dating_app/presentation/pages/auth/components/widgets/social_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaGroupWidget extends StatelessWidget {
  const SocialMediaGroupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(
          flex: 5,
        ),
        SocialButtonWidget(
          icon: FontAwesomeIcons.google,
        ),
        Spacer(),
        SocialButtonWidget(
          icon: FontAwesomeIcons.apple,
        ),
        Spacer(),
        SocialButtonWidget(
          icon: FontAwesomeIcons.facebookF,
        ),
        Spacer(
          flex: 5,
        ),
      ],
    );
  }
}