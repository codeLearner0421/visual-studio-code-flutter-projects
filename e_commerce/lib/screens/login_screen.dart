import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:e_commerce/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.primaryLight,
              child: Center(
                child: Image.asset(
                  "assets/images/app_logo.png",
                  width: AppImage.widthNormal,
                  height: AppImage.heightNormal,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.large,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          loginTitle,
                          style: TextStyle(
                            fontSize: AppFontSize.large,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppMargin.small),
                        Text(
                          loginDescription,
                          style: TextStyle(
                            fontSize: AppFontSize.normal,
                            color: AppColors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppMargin.normal),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: loginEmailTitle,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              labelText: loginPasswordTitle,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            Text(
                              loginRememberMeTitle,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            loginForgetPasswordTitle,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppMargin.normal),
                    SizedBox(
                      width: AppButtonSize.normal,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          loginSignInTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: AppMargin.small),
                    SizedBox(
                      width: AppButtonSize.normal,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          loginCreateAccountTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: AppMargin.normal),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Divider(
                            color: AppColors.grey,
                            thickness: 0.5,
                            indent: 60,
                            endIndent: 5,
                          ),
                        ),
                        Text(
                          Utils.capitalizeTitle(loginOrSignInWith),
                          style: TextStyle(
                            fontSize: AppFontSize.small,
                            color: AppColors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Flexible(
                          child: Divider(
                            color: AppColors.grey,
                            thickness: 0.5,
                            indent: 5,
                            endIndent: 60,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppMargin.small),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(
                              AppCardRadius.normal,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image(
                              width: AppImage.widthSmall,
                              height: AppImage.heightSmall,
                              image: AssetImage(
                                "assets/images/google_icon.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppMargin.extraSmall),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(
                              AppCardRadius.normal,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image(
                              width: AppImage.widthSmall,
                              height: AppImage.heightSmall,
                              image: AssetImage(
                                "assets/images/facebook_icon.png",
                              ),
                            ),
                          ),
                        ),
                      ],
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
