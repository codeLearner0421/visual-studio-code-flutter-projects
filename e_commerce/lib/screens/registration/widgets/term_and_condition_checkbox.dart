import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimension.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermAndConditionCheckboxWidget extends StatelessWidget {
  const TermAndConditionCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: false,
      validator: (value) {
        if (value != true) {
          return "You must accept the terms and conditions";
        }
        return null;
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: AppBoxSize.normal,
                  height: AppBoxSize.normal,
                  child: Checkbox(
                    value: state.value,
                    onChanged: state.didChange,
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
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.small, top: AppPadding.extraSmall),
                child: Text(
                  state.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
