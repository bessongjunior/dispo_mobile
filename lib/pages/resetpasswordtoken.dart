// ignore_for_file: must_be_immutable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:dispo_mobile/utils/formerror.dart';
import 'package:dispo_mobile/widgets/themebutton.dart';
import 'package:dispo_mobile/utils/constants.dart';
import 'package:dispo_mobile/utils/sizeconfig.dart';
// //here is were your pass word gets updated in the database

class PasswordTokenPage extends StatefulWidget {
  const PasswordTokenPage({Key? key}) : super(key: key);

  @override
  State<PasswordTokenPage> createState() => _PasswordTokenPageState();
}

class _PasswordTokenPageState extends State<PasswordTokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Please enter your email and we will send \nyou a link to return to your account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                const ResetPasswordTokenForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ResetPasswordTokenForm extends StatefulWidget {
  const ResetPasswordTokenForm({Key? key}) : super(key: key);
  
  @override
  State<ResetPasswordTokenForm> createState() => _ResetPasswordTokenFormState();
}

class _ResetPasswordTokenFormState extends State<ResetPasswordTokenForm> {
  final _formKey = GlobalKey<FormState>(); //
  List<String> errors = [];
  String? reset_password;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[

            TextFormField(
              obscureText: true,
              onSaved: (newValue) => reset_password = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: passNullError);
                } else if (value.length >= 8) {
                  removeError(error: shortPassError);
                }
                reset_password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: passNullError);
                  return "";
                } else if (value.length < 8) {
                  addError(error: shortPassError);
                  return "";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Enter New Password",
                hintText: "Enter your new password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            ThemeButton(
                label: 'Change Password',
                highlight: Colors.purple[900],
                color: Colors.deepPurple, //AppColors.MAIN_COLOR,
                onClick: () {
                }
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This will change your password",
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Abort Operation",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}

