import 'package:e_commerce/constants/dimens.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:e_commerce/screens/registration/widgets/term_and_condition_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Expose controllers (so parent can access them)
  TextEditingController get firstName => firstNameController;
  TextEditingController get lastName => lastNameController;
  TextEditingController get username => usernameController;
  TextEditingController get email => emailController;
  TextEditingController get phone => phoneController;
  TextEditingController get password => passwordController;

  bool hidePasswordInitialState = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return pleaseEnterYourTitle + registrationFirstNameTitle;
                  }
                  return null;
                },
                expands: false,
                decoration: InputDecoration(
                  labelText: registrationFirstNameTitle,
                  prefixIcon: Icon(Icons.person),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
                controller: lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return pleaseEnterYourTitle + registrationLastNameTitle;
                  }
                  return null;
                },
                expands: false,
                decoration: InputDecoration(
                  labelText: registrationLastNameTitle,
                  prefixIcon: Icon(Icons.person),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
          controller: usernameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return pleaseEnterYourTitle + registrationUsernameTitle;
            }
            return null;
          },
          expands: false,
          decoration: InputDecoration(
            labelText: registrationUsernameTitle,
            prefixIcon: Icon(Icons.person_pin_outlined),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppCardRadius.extraSmall),
            ),
          ),
        ),
        SizedBox(height: AppMargin.small),
        TextFormField(
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return pleaseEnterYourTitle + registrationEmailTitle;
            }
            if (!EmailValidator.validate(value.trim()))
            {
              return pleaseEnterAValidEmailAddressTitle;
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: registrationEmailTitle,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppCardRadius.extraSmall),
            ),
          ),
        ),
        SizedBox(height: AppMargin.small),
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return pleaseEnterYourTitle + registrationPhoneNumberTitle;
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            labelText: registrationPhoneNumberTitle,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppCardRadius.extraSmall),
            ),
          ),
        ),
        SizedBox(height: AppMargin.small),
        TextFormField(
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return pleaseEnterYourTitle + loginPasswordTitle;
            }
            if (value.trim().length < 6) {
              return passwordMustBeAtLeast6CharactersLongTitle;
            }
            return null;
          },
          obscureText: hidePasswordInitialState,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.password),
            labelText: loginPasswordTitle,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            suffixIcon: IconButton(
              icon: Icon(hidePasswordInitialState ? Icons.visibility_off : Icons.visibility_sharp),
              onPressed: () {
                setState(() {
                  hidePasswordInitialState = !hidePasswordInitialState;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppCardRadius.extraSmall),
            ),
          ),
        ),
        SizedBox(height: AppMargin.small),
        TermAndConditionCheckboxWidget(),
      ],
    );
  }
}