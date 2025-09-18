import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:e_commerce/screens/password/password_reset_screen.dart';
import 'package:flutter/material.dart';

class PasswordForgetScreen extends StatelessWidget {
  const PasswordForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              passwordForgetTitle,
              style: TextStyle(
                fontSize: AppFontSize.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppMargin.small),
            Text(
              passwordForgetDescription,
              style: TextStyle(
                fontSize: AppFontSize.normal,
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppMargin.normal),
            // Form
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: passwordForgetEmailTitle,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppCardRadius.extraSmall),
                ),
              ),
            ),
            SizedBox(height: AppMargin.normal),
            // Submit Button
            SizedBox(
              width: AppButtonSize.normal,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PasswordResetScreen()));
                },
                child: Text(
                  passwordForgetSubmitTitle,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
