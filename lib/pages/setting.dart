import 'package:dispo_mobile/pages/otpverification.dart';
import 'package:dispo_mobile/pages/resetpassword.dart';
import 'package:dispo_mobile/pages/resetpasswordtoken.dart';
import 'package:dispo_mobile/pages/updateprofile.dart';
import 'package:dispo_mobile/widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';

import 'profile.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: const <Widget> [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Profile Image.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //Todo: add account text as in design
            SettingInfo(
              text: "Notification",
              icon: const Icon(Icons.notification_important),
              press: () => {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => const  ProfilePage()))
              },
            ),
            SettingInfo(
              text: "Password Reset",
              icon: const Icon(Icons.lock_reset),
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const ResetPasswordPage()));
              },
            ),
            SettingInfo(
              text: "Privacy Policy",
              icon: const Icon(Icons.shield),
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const OtpVerification()));
              },
            ),
            SettingInfo(
              text: "Terms and condition",
              icon: const Icon(Icons.description),
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const PasswordTokenPage()));
              },
            ),
            SettingInfo(
              text: "Help and Support",
              icon: const Icon(Icons.help),
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const UpdateProfile()));
              },
            ),
            SettingInfo(
              text: "Feedback",
              icon: const Icon(Icons.feedback),
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const MyHomePage()));
              },
            ),
            SettingInfo(
              text: "Logout",
              icon: const Icon(Icons.logout),
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}





class SettingInfo extends StatelessWidget {
  final String text;
  Widget? icon;
  final VoidCallback? press;

  SettingInfo({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.black26,//(0xFFF5F6F9)
        ),
        onPressed: press,
        child: Row(
          children: [
            icon!,
            // SvgPicture.asset(
            //   color: Colors.white,
            //   width: 22,
            //   icon,
            // ),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

