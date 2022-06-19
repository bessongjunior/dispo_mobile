import 'package:dispo_mobile/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:dispo_mobile/utils/formerror.dart';
import 'package:dispo_mobile/widgets/themebutton.dart';
import 'package:dispo_mobile/utils/constants.dart';
import 'package:dispo_mobile/utils/sizeconfig.dart';
//here is were your email is obtained for a reset email set to you for you to reset your passcode
// on reset password token or phone number to otp n passcode verification.

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
                const ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(emailNullError)) {
                setState(() {
                  errors.remove(emailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(invalidEmailError)) {
                setState(() {
                  errors.remove(invalidEmailError);
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(emailNullError)) {
                setState(() {
                  errors.add(emailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(invalidEmailError)) {
                setState(() {
                  errors.add(invalidEmailError);
                });
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.mail)
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          // DefaultButton(
          //   text: "Continue",
          //   press: () {
          //     if (_formKey.currentState!.validate()) {
          //       // Do what you want to do
          //     }
          //   },
          // ),
          ThemeButton(
              label: 'Continue',
              highlight: Colors.purple[900],
              color: Colors.deepPurple, //AppColors.MAIN_COLOR,
              onClick: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const HomePage()));
                //   // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
              }
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account? ",
                style: TextStyle(fontSize: getProportionateScreenWidth(16)),
              ),
              GestureDetector(
                onTap: () {}, //=> Navigator.pushNamed(context, SignUpScreen.routeName),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: AppColors.Main_Color),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
