import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:flutter/material.dart';

class loginForm extends StatelessWidget {
  const loginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: loginEmailTitle,
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
          SizedBox(height: AppMargin.small,),
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
        ],
      ),
    );
  }
}