import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:flutter/material.dart';

class EmailVerificationSuccessfulScreen extends StatelessWidget {
  const EmailVerificationSuccessfulScreen({super.key, required this.image, required this.title, required this.description, required this.onPressed});

  final String image, title, description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(AppPadding.large),
            child: Column(
              children: [
                Image.asset(
                  image,
                  width: AppImage.widthLarge,
                  height: AppImage.heightNormal,
                ),
                SizedBox(height: AppMargin.small),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppFontSize.large,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppMargin.small),
                Text(
                  description,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: AppFontSize.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppMargin.normal),
                SizedBox(
                  width: AppButtonSize.normal,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      emailVerificationContinueTitle,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
