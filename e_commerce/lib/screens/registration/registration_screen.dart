import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:e_commerce/screens/registration/widgets/registration_form_widget.dart';
import 'package:e_commerce/utils/utils.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Registration"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.normal),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        registrationTitle,
                        style: TextStyle(
                          fontSize: AppFontSize.large,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppMargin.normal),
                      registrationForm(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.normal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: AppButtonSize.normal,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          registrationCreateAccountTitle,
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
                          Utils.capitalizeTitle(registrationOrSignUpWith),
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
                              image: AssetImage("assets/images/google_icon.png"),
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
          ],
        ),
      ),
    );
  }
}
