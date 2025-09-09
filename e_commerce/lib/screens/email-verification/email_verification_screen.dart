import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:e_commerce/screens/email-verification/email_verification_successful_screen.dart';
import 'package:e_commerce/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

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
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Image.asset(
                "assets/images/email_verification_logo.png",
                width: AppImage.widthLarge,
                height: AppImage.heightLarge,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppPadding.large),
                child: Column(
                  children: [
                    Text(
                      emailVerificationTitle,
                      style: TextStyle(
                        fontSize: AppFontSize.large,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppMargin.small),
                    Text(
                      "youremailaddress@ecommerce.com",
                      style: TextStyle(
                        fontSize: AppFontSize.normal,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppMargin.small),
                    Text(
                      emailVerificationDescription,
                      style: TextStyle(
                        fontSize: AppFontSize.normal,
                        color: AppColors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppMargin.normal),
                    SizedBox(
                      width: AppButtonSize.normal,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EmailVerificationSuccessfulScreen(
                                image:
                                    'assets/images/email_verification_successful_logo.png',
                                title: emailVerificationSuccessfulTitle,
                                description: emailVerificationDescription,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child: Text(
                          emailVerificationContinueTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: AppMargin.small),
                    SizedBox(
                      width: AppButtonSize.normal,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          emailVerificationResendEmailTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
