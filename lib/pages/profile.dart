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
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: const <Widget> [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Profile Image.png"),
                  ),
                  // Positioned(
                  //   right: -16,
                  //   bottom: 0,
                  //   child: SizedBox(
                  //     height: 46,
                  //     width: 46,
                  //     child: TextButton(
                  //       style: TextButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(50),
                  //           side: const BorderSide(color: Colors.white),
                  //         ),
                  //         primary: Colors.white,
                  //         backgroundColor: const Color(0xFFF5F6F9),
                  //       ),
                  //       onPressed: () {}, child: null,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: const Icon(Icons.account_circle),//"assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: const Icon(Icons.notifications),//"assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: const Icon(Icons.settings),//"assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: const Icon(Icons.help),//"assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: const Icon(Icons.logout),//"assets/icons/Log out.svg",
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
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),

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