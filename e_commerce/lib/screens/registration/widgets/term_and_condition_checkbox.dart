import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class termAndConditionCheckboxWidget extends StatelessWidget {
  const termAndConditionCheckboxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppBoxSize.normal,
          height: AppBoxSize.normal,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        SizedBox(width: AppMargin.small),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$registrationIAgreeTo ',
                style: TextStyle(
                  fontSize: AppFontSize.small,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: registrationPrivacyPolicy,
                style: TextStyle(
                  fontSize: AppFontSize.normal,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {},
              ),
              TextSpan(
                text: ' $registrationAnd ',
                style: TextStyle(
                  fontSize: AppFontSize.small,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: registrationTermOfUse,
                style: TextStyle(
                  fontSize: AppFontSize.normal,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
