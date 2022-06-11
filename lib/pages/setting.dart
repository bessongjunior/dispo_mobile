import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting', style: TextStyle(fontSize: 22) ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: const [
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
                    //       onPressed: () {},
                    //       child: const Icon(Icons.camera_alt),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Container(
                color: Colors.black38,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: <Widget>[
                    // GestureDetection (
                    //   text: "My Account",
                    //   icon:  const Icon(Icons.account_circle),//'',
                    //   press: () => {}
                    // ),
                    GestureDetection(
                        text: 'Notification',
                        icon: const Icon(Icons.notification_important),
                        press: () => {}
                    ),
                    GestureDetection(
                        text: 'Reset Password',
                        icon: const Icon(Icons.lock_reset),
                        press: () => {}
                    ),
                    GestureDetection(
                        text: 'Report History',
                        icon: const Icon(Icons.poll),
                        press: () => {}
                    ),
                    GestureDetection(
                        text: 'Help and Support',
                        icon: const Icon(Icons.help),
                        press: () => {}
                    ),
                    GestureDetection(
                        text: 'Feedback',
                        icon: const Icon(Icons.feedback),
                        press: () => {}
                    ),
                    GestureDetection(
                        text: 'Privacy Policy',
                        icon: const Icon(Icons.policy),
                        press: () => {}
                    ),
                    GestureDetection(
                        text: 'Terms and conditions',
                        icon: const Icon(Icons.description),
                        press: () => {}
                    ),
                    GestureDetection(
                        text: 'logout',
                        icon: const Icon(Icons.logout),
                        press: () => {}
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class GestureDetection extends StatelessWidget {
  GestureDetection({Key? key, required this.text, required this.icon, this.press}) : super(key: key);

  // final String icon, size, color;
  Widget? icon;
  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        // elevation: 1.0,
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            // Container(
            //     child: icon!
            // ),
            icon!,
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
