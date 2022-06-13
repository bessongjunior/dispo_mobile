// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            ProfileMenu(
              text: "Username",
              icon: const Icon(Icons.account_circle),
              press: () => {},
            ),
            //Todo: add password here as in design
            //Todo:add contact details as in design
            ProfileMenu(
              text: "Email Address",
              icon: const Icon(Icons.mail),
              press: () {},
            ),
            ProfileMenu(
              text: "Phone number",
              icon: const Icon(Icons.phone),
              press: () {},
            ),
            ProfileMenu(
              text: "Residential Address",
              icon: const Icon(Icons.place),
              press: () {},
            ),
            //Todo: add prodile update text as in design
            ProfileMenu(
              text: "Update your profile",
              icon: const Icon(Icons.verified_user),
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileMenu extends StatelessWidget {
  final String text;
  Widget? icon;
  final VoidCallback? press;

  ProfileMenu({
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