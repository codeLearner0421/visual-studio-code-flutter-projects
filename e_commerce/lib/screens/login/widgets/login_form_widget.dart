import 'package:e_commerce/constants/dimension.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Expose controllers (so parent can access them)
  TextEditingController get email => emailController;
  TextEditingController get password => passwordController;

  bool hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return pleaseEnterYourTitle + loginEmailTitle;
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: loginEmailTitle,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppCardRadius.extraSmall),
            ),
          ),
        ),
        SizedBox(height: AppMargin.small),
        TextFormField(
          controller: passwordController,
          obscureText: hidePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return pleaseEnterYourTitle + loginPasswordTitle;
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.password),
            labelText: loginPasswordTitle,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            suffixIcon: IconButton(
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility_sharp,
              ),
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppCardRadius.extraSmall),
            ),
          ),
        ),
      ],
    );
  }
}
