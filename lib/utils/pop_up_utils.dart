import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class PopUpUtils {
  static void showPopup(BuildContext context, bool success,{required String successMessage, required String failureMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: success
            ? Text(successMessage)
            : Text(failureMessage),
        backgroundColor: AppColors.primaryRed,
      ),
    );
  }
}
