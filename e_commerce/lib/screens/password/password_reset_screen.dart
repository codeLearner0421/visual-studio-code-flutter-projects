import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:e_commerce/screens/login/login_screen.dart';
import 'package:e_commerce/screens/password/password_forget_screen.dart';
import 'package:flutter/material.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (route) => false,
              );
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.normal),
          child: Column(
            children: [
              // Image
              Image.asset(
                'assets/images/password_reset_email_sent_logo.png',
                width: AppImage.widthLarge,
                height: AppImage.heightNormal,
              ),
              SizedBox(height: AppMargin.small),
              // Title & Description
              Text(
                passwordResetTitle,
                style: TextStyle(
                  fontSize: AppFontSize.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppMargin.small),
              Text(
                passwordResetDescription,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: AppFontSize.normal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppMargin.normal),
              // Buttons
              SizedBox(
                width: AppButtonSize.normal,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    passwordResetDoneTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: AppMargin.small),
              SizedBox(
                width: AppButtonSize.normal,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PasswordForgetScreen()),
                    );
                  },
                  child: Text(
                    passwordResetResendEmailTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
