import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:e_commerce/screens/registration/widgets/term_and_condition_checkbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class registrationForm extends StatelessWidget {
  const registrationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: registrationFirstNameTitle,
                    prefixIcon: Icon(Icons.person),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppCardRadius.extraSmall,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppMargin.small),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: registrationLastNameTitle,
                    prefixIcon: Icon(Icons.person),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppCardRadius.extraSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppMargin.small),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: registrationUsernameTitle,
              prefixIcon: Icon(Icons.person_pin_outlined),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppCardRadius.extraSmall,
                ),
              ),
            ),
          ),
          SizedBox(height: AppMargin.small),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: registrationEmailTitle,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppCardRadius.extraSmall,
                ),
              ),
            ),
          ),
          SizedBox(height: AppMargin.small),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: registrationPhoneNumberTitle,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppCardRadius.extraSmall,
                ),
              ),
            ),
          ),
          SizedBox(height: AppMargin.small),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              labelText: loginPasswordTitle,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: Icon(Icons.visibility_off),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppCardRadius.extraSmall,
                ),
              ),
            ),
          ),
          SizedBox(height: AppMargin.small),
          termAndConditionCheckboxWidget(),
        ],
      ),
    );
  }
}