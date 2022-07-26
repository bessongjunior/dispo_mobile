// ignore_for_file: file_names, constant_identifier_names, must_be_immutable, non_constant_identifier_names, deprecated_member_use
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
        routes: {
          '/': (context) =>
              SplashPage(duration: 5, goToPage: const Register()),
          '/welcomepage': (context) => const WelcomePage(),
       //   // '/homepage': (context) => HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/setting': (context) => const SettingsPage(),
          '/dashboard': (context) => const DashboardPage(),
          '/notifications': (context) => const NotificationPage(),
          '/profileupdate': (context) => const UpdateProfile(),
          '/onboardingpage': (context) => const OnboardingPage(),
       //   '/forgotpassword': (context) => ForgotPasswordPage(),
       //   '/resetpassword': (context) => ResetPasswordPage(),
       //   '/otpverification': (context) => OtpVerification(),
       //   '/signin': (context) => LogInPage(),
          '/signin': (context) => const Register(),
       //   '/signup': (context) => RegistrationPage(),
      //    '/completesignup': (context) => ResetPasswordPage(),
          // '/logout': (context) => LogOut(),

          '/about': (context) => const AboutPage(),
          '/faq': (context) => const FaqPage(),
          '/feedback': (context) => const FeedBackPage(),
          '/help': (context) => const HelpPage(),
          '/privacy': (context) => const PrivacyPage(),
          '/terms': (context) => const TermsPage(),
          '/useragreement': (context) => const AgreementPage(),
          '/language': (context) => const LanguageSupport(),
        }
    );
  }
}


class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "Help and Support",
          backButton: true,
          bgColor: AppColors.primary
      ),
      body: SizedBox(
        height: 500,
        child: const Text('help'),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {

  int? duration = 0;
  Widget? goToPage;

  SplashPage({Key? key, required this.duration, required this.goToPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //constructor for passing duration and routing to the next page.
    Future.delayed(Duration(seconds: duration!), ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> goToPage!) ));
    return Material(
      child: Container(
        color: AppColors.MainColor,
        alignment: Alignment.center,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              //Todo: Add app logo here!!
              //child: Image() //size == 100
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white.withOpacity(0.5)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool switchValueOne;
  late bool switchValueTwo;

  @override
  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Navbar(
            title: "Settings",
            bgColor: AppColors.primary
        ),
        backgroundColor: AppColors.bgColorScreen,
        drawer: const DrawerNav(currentPage: 'setting',),
        // drawer: NowDrawer(currentPage: "Settings"),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
                child: Column(
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("Recommended Settings",
                            style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("Very important settings",
                            style:
                            TextStyle(color: AppColors.time, fontSize: 14)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.notifications),
                        const Text("Notifications",
                            style: TextStyle(color: AppColors.text)),
                        Switch.adaptive(
                          value: switchValueOne,
                          onChanged: (bool newValue) =>
                              setState(() => switchValueOne = newValue),
                          activeColor: AppColors.primary,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.report),
                        const Text("Report stats table",
                            style: TextStyle(color: AppColors.text)),
                        Switch.adaptive(
                          value: switchValueTwo,
                          onChanged: (bool newValue) =>
                              setState(() => switchValueTwo = newValue),
                          activeColor: AppColors.primary,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.fingerprint),
                        const Text("Fingerprint Unlock",
                            style: TextStyle(color: AppColors.text)),
                        Switch.adaptive(
                          value: switchValueOne,
                          onChanged: (bool newValue) =>
                              setState(() => switchValueOne = newValue),
                          activeColor: AppColors.primary,
                        )
                      ],
                    ),
                    SettingsInfo(
                        icon:  const Icon(Icons.flag),
                        title: "Select language support"
                    ),
                    const SizedBox(height: 36.0),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text("Assistive Settings",
                            style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("Also important settings",
                            style: TextStyle(color: AppColors.time)),
                      ),
                    ),
                    // TableCellSettings(title: "Manage Payment Options"),
                    SettingsInfo(
                        icon:  const Icon(Icons.content_paste),
                        title: "About Us"
                    ),
                    SettingsInfo(
                        icon:  const Icon(Icons.help),
                        title: "Help & support",
                        onTap: () {
                          // Navigator.pushNamed(context, '/pro');
                        }),
                    SettingsInfo(
                        icon:  const Icon(Icons.feedback),
                        title: "Feedback",
                        onTap: () {
                          // Navigator.pushNamed(context, '/pro');
                        }),
                    SettingsInfo(
                        icon:  const Icon(Icons.help_center),
                        title: "FAQ",
                        onTap: () {
                          // Navigator.pushNamed(context, '/pro');
                        }),
                    const SizedBox(height: 36.0,),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text("Privacy Settings",
                            style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("Third most important settings",
                            style: TextStyle(color: AppColors.time)),
                      ),
                    ),
                    SettingsInfo(
                        icon:  const Icon(Icons.insert_drive_file),
                        title: "User Agreement",
                        onTap: () {
                          // Navigator.pushNamed(context, '/pro');
                        }),
                    SettingsInfo(
                        icon:  const Icon(Icons.description),
                        title: "Privacy Policy",
                        onTap: () {
                          // Navigator.pushNamed(context, '/pro');
                        }),
                    SettingsInfo(
                        icon:  const Icon(Icons.insert_drive_file),
                        title: "Terms & conditions",
                        onTap: () {
                          // Navigator.pushNamed(context, '/pro');
                        }),
                  ],
                ),
              ),
            )));
  }
}

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool backButton;
  final bool transparent;
  final bool rightOptions;
  final VoidCallback? getCurrentPage;
  final bool noShadow;
  final Color bgColor;

  const Navbar({Key? key,
    this.title = "Home",
    this.categoryOne = "",
    this.categoryTwo = "",
    this.transparent = false,
    this.rightOptions = true,
    this.getCurrentPage,
    this.backButton = false,
    this.noShadow = false,
    this.bgColor = AppColors.white,
  }) : super(key: key);

  final double _prefferedHeight = 180.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? AppColors.initial
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: const Offset(0, 5))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                                !widget.backButton
                                    ? Icons.menu
                                    : Icons.arrow_back_ios,
                                color: !widget.transparent
                                    ? (widget.bgColor == AppColors.white
                                    ? AppColors.initial
                                    : AppColors.white)
                                    : AppColors.white,
                                size: 24.0),
                            onPressed: () {
                              if (!widget.backButton) {
                                Scaffold.of(context).openDrawer();
                              } else {
                                Navigator.pop(context);
                              }
                            }),
                        Text(widget.title,
                            style: TextStyle(
                                color: !widget.transparent
                                    ? (widget.bgColor == AppColors.white
                                    ? AppColors.initial
                                    : AppColors.white)
                                    : AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0)),
                      ],
                    ),
                    // if (widget.rightOptions)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/notifications');
                          },
                          child: IconButton(
                              icon: Icon(Icons.notifications_active,
                                  color: !widget.transparent
                                      ? (widget.bgColor == AppColors.white
                                      ?  AppColors.initial
                                      :  AppColors.white)
                                      :  AppColors.white,
                                  size: 22.0),
                              onPressed: null),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/language');
                          },
                          child: IconButton(
                              icon: Icon(Icons.flag,
                                  color: !widget.transparent
                                      ? (widget.bgColor ==  AppColors.white
                                      ?  AppColors.initial
                                      :  AppColors.white)
                                      :  AppColors.white,
                                  size: 22.0),
                              onPressed: null),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ));
  }
}

class DrawerNav extends StatelessWidget {
  final String currentPage;

  const DrawerNav({Key? key, required this.currentPage}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: AppColors.white,
          child: Column(children: [
            // ignore: sized_box_for_whitespace
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.85,
                child: SafeArea(
                  bottom: false,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Image.asset("assets/image/dispo-logo.png"),
                    ),
                  ),
                )
            ),
            Expanded(
              flex: 2,
              child: ListView(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                children: [
                  DrawerNavTile(
                      icon: Icons.home,
                      onTap: () {
                        if (currentPage != "home") {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      iconColor: AppColors.primary,
                      title: "Home",
                      isSelected: currentPage == "home" ? true : false),
                  DrawerNavTile(
                      icon: Icons.person,
                      onTap: () {
                        if (currentPage != "Profile") {
                          Navigator.pushReplacementNamed(context, '/profile');
                        }
                      },
                      iconColor: AppColors.warning,
                      title: "Profile",
                      isSelected: currentPage == "profile" ? true : false),
                  DrawerNavTile(
                      icon: Icons.settings,
                      onTap: () {
                        if (currentPage != "setting") {
                          Navigator.pushReplacementNamed(context, '/setting');
                        }
                      },
                      iconColor: AppColors.info,
                      title: "Settings",
                      isSelected: currentPage == "setting" ? true : false),
                  DrawerNavTile(
                      icon: Icons.dashboard,
                      onTap: () {
                        if (currentPage != "dashboard") {
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        }
                      },
                      iconColor: AppColors.error,
                      title: "Dashboard",
                      isSelected: currentPage == "dashboard" ? true : false),
                  DrawerNavTile(
                      icon: Icons.notifications,
                      onTap: () {
                        if (currentPage != "notifications") {
                          Navigator.pushReplacementNamed(context, '/notifications');
                        }
                      },
                      iconColor: AppColors.primary,
                      title: "Notifications",
                      isSelected: currentPage == "notifications" ? true : false),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(height: 5, thickness: 0, color: AppColors.muted),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                        child: Text("ACCOUNT RELATED",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 15,
                            )),
                      ),
                      //TODO : implement logout functionality
                      DrawerNavTile(
                          icon: Icons.security,
                          onTap: () {
                            if (currentPage != "updateprofile") {
                              Navigator.pushReplacementNamed(context, '/updateprofile');
                            }
                          },
                          iconColor: AppColors.muted,
                          title: "Update Profile",
                          isSelected: currentPage == "updateprofile" ? true : false
                      ),
                      DrawerNavTile(
                          icon: Icons.vpn_key,
                          onTap: () {
                            if (currentPage != "resetpassword") {
                              Navigator.pushReplacementNamed(context, '/resetpassword');
                            }
                          },
                          iconColor: AppColors.muted,
                          title: "Change Password",
                          isSelected: currentPage == "resetpassword" ? true : false
                      ),
                      DrawerNavTile(
                          icon: Icons.logout,
                          onTap: () {
                            if (currentPage != "logout") {
                              Navigator.pushReplacementNamed(context, '/welcomepage');
                            }
                          },
                          iconColor: AppColors.muted,
                          title: "Logout",
                          isSelected: currentPage == "logout" ? true : false
                      ),
                    ],
                  )),
            ),
          ]),
        ));
  }
}

class DrawerNavTile extends StatelessWidget {
  final String title;
  final IconData icon;
  // final Function? onTap;
  final VoidCallback? onTap;
  final bool isSelected;
  final Color iconColor;

  const DrawerNavTile({Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
    this.iconColor = AppColors.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Icon(icon,
                  size: 20, color: isSelected ? AppColors.white : iconColor),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title,
                    style: TextStyle(
                        letterSpacing: .3,
                        fontSize: 15,
                        color: isSelected
                            ? AppColors.white
                            : const Color.fromRGBO(0, 0, 0, 0.7))),
              )
            ],
          )),
    );
  }
}

class AppColors {
  static const Color MainColor  = Color(0xff673ab7);

  static const Color MainHov = Color(0x5E6F49D9);

  static const Color black = Color(0xFF000000);

  static const Color white = Color(0xFFFFFFFF);

  static const Color initial = Color.fromRGBO(23, 43, 77, 1.0);

  static const Color primary = Color.fromRGBO(94, 114, 228, 1.0);

  static const Color secondary = Color.fromRGBO(247, 250, 252, 1.0);

  static const Color label = Color.fromRGBO(254, 36, 114, 1.0);

  static const Color info = Color.fromRGBO(17, 205, 239, 1.0);

  static const Color error = Color.fromRGBO(245, 54, 92, 1.0);

  static const Color success = Color.fromRGBO(45, 206, 137, 1.0);

  static const Color warning = Color.fromRGBO(251, 99, 64, 1.0);

  static const Color header = Color.fromRGBO(82, 95, 127, 1.0);

  static const Color bgColorScreen = Color.fromRGBO(248, 249, 254, 1.0);

  static const Color border = Color.fromRGBO(202, 209, 215, 1.0);

  static const Color inputSuccess = Color.fromRGBO(123, 222, 177, 1.0);

  static const Color inputError = Color.fromRGBO(252, 179, 164, 1.0);

  static const Color muted = Color.fromRGBO(136, 152, 170, 1.0);

  static const Color text = Color.fromRGBO(50, 50, 93, 1.0);

  static const Color time = Color.fromRGBO(154, 154, 154, 1.0);

  static const Color switchON = Color(0xff673ab7);

  static const Color switchOFF = Color.fromRGBO(159, 165, 170, 1.0);

  static const Color blue = Color.fromRGBO(13, 26, 163, 1.0);
}

class SettingsInfo extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  Widget? icon;

  SettingsInfo({Key? key,required this.icon, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon!,
            Text(title, style: const TextStyle(color: AppColors.text)),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_forward_ios,
                  color: AppColors.text, size: 14),
            )
          ],
        ),
      ),
    );
  }
}


class ThemeButton extends StatelessWidget {

  String label;
  Function onClick;
  Color color;
  Color highlight;
  Widget? icon;
  Color borderColor;
  Color labelColor;
  double borderWidth;

  ThemeButton({Key? key,
    required this.label,
    this.labelColor = Colors.white,
    this.color = AppColors.MainHov,
    this.highlight = AppColors.MainColor,
    this.icon,
    this.borderColor = Colors.transparent,
    this.borderWidth = 4,
    required this.onClick }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            color: color,
            child: InkWell(
              splashColor: highlight,
              highlightColor: highlight,
              onTap: () {
                onClick();
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: borderColor,
                          width: borderWidth)
                  ),
                  child: icon == null ?
                  Text(label,
                      style: TextStyle(
                          fontSize: 16,
                          color: labelColor,
                          fontWeight: FontWeight.bold)) :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      const SizedBox(width: 10),
                      Text(label,
                          style: TextStyle(
                              fontSize: 16,
                              color: labelColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
              ),
            ),
          )),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.icon,
    required this.press,
    // required this.fill
  }) : super(key: key);

  final Widget? icon;
  final Function? press;
  // late Color? fill;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as Function()?,
      child: Container(
          margin:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          padding: EdgeInsets.all(getProportionateScreenWidth(12)),
          height: getProportionateScreenHeight(40),
          width: getProportionateScreenWidth(40),
          decoration: const BoxDecoration(
            color: AppColors.white,//fill,
            shape: BoxShape.circle,
          ),
          child: icon  // SvgPicture.asset(icon!),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  Widget? icon;

  ProfileInfo({Key? key,required this.icon, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon!,
            Text(title, style: const TextStyle(color: AppColors.text)),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_forward_ios,
                  color: AppColors.text, size: 14),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationCardTiles extends StatelessWidget {
  const NotificationCardTiles({Key? key, required this.title, required this.subtitle, this.onTap, required this.enable}) : super(key: key);

  final String title, subtitle;
  final VoidCallback? onTap;
  final bool enable;

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        leading: const SizedBox(
          height: 50.0,
          width: 50.0,
          child: Icon(Icons.notifications, size: 50,),
        ),
        title: Text(title, style: const TextStyle(color: AppColors.text)),
        subtitle: Text(subtitle,
            style: const TextStyle(color: AppColors.muted)),
        onTap: onTap!,
        enabled: enable,
      ),
    );
  }
}

class DescriptionNotice extends StatelessWidget {
  final String text;
  const DescriptionNotice({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10.0, horizontal: 16.0),
      child: Text(text, style: const TextStyle(fontSize: 18.0, color: AppColors.text,)),
    );
  }
}

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: AppColors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please Enter your email";
const String invalidEmailError = "Please Enter Valid Email";
const String passNullError = "Please Enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords don't match";
const String nameNullError = "Please Enter your name";
const String phoneNumberNullError = "Please Enter your phone number";
const String addressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: AppColors.text),
  );
}

class Input extends StatelessWidget {
  final String placeholder;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final VoidCallback? onTap;
  final Function(String)? onChanged;  //Function onChanged
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;

  const Input({Key? key,
    required this.placeholder,
    this.suffixIcon,
    required this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.autofocus = false,
    this.borderColor = AppColors.border,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: AppColors.muted,
        onTap: onTap!,
        onChanged: onChanged!,
        controller: controller,
        autofocus: autofocus,
        style:
        const TextStyle(height: 0.85, fontSize: 14.0, color: AppColors.initial),
        textAlignVertical: const TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintStyle: const TextStyle(
              color: AppColors.muted,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder)
      // onChanged: onChanged,,
    );
  }
}

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        // SvgPicture.asset(
        //   "assets/icons/Error.svg",
        //   height: getProportionateScreenWidth(14),
        //   width: getProportionateScreenWidth(14),
        // ),
        const Icon(Icons.error),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoginService loginService = Provider.of<LoginService>(context, listen: false);

    return Scaffold(
        body: Stack(children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/dispo-background.png"),
                      fit: BoxFit.cover))),
          Padding(
            padding:
            const EdgeInsets.only(top: 40, left: 32, right: 32, bottom: 10),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/dispo-default-logo.png", scale: 1),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(right: 48.0),
                        child: Text.rich(TextSpan(
                            text: "Dispo App Welcome",
                            style: const TextStyle(color: Colors.white, fontSize: 58),
                            children: <InlineSpan>[
                              WidgetSpan(
                                  child: Container(
                                      padding: const EdgeInsets.all(2.0),
                                      margin: const EdgeInsets.fromLTRB(
                                          0.0, 0.0, 50.0, 50.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4.0),
                                          color: const Color.fromRGBO(17, 205, 239, 1)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            top: 0, bottom: 0, left: 4, right: 4),
                                      ))),
                            ])),
                      ),
                    ],
                  ),
                  const Text(
                      "Get your community clean only by snapping any public garbage and litters around and report to us.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w200)),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                        width: double.infinity,
                        child: ThemeButton(
                          label: 'Home',
                          highlight: AppColors.MainColor,
                          color: AppColors.primary,
                          onClick: () {
                            // Utils.mainAppNav.currentState.pushNamed('/mainpage');
                            Navigator.pushNamed(context, '/home');
                          },
                        )
                      // FlatButton(
                      //   textColor: AppColors.white,
                      //   color: AppColors.info,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(4.0),
                      //   ),
                      //   onPressed: (){},
                      //   child: const Padding(
                      //       padding: EdgeInsets.only(
                      //           left: 16.0, right: 16.0, top: 12, bottom: 12),
                      //       child: Text("BUY NOW",
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w600,
                      //               fontSize: 16.0))),
                      // ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                        width: double.infinity,
                        child: ThemeButton(
                          label: 'Onboarding',
                          highlight: AppColors.MainColor,
                          color: AppColors.MainHov,
                          onClick: () {
                            // Utils.mainAppNav.currentState.pushNamed('/onboardingpage');
                            Navigator.pushNamed(context, '/onboarding');
                          },
                        )
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ThemeButton(
                        label: "Login",
                        labelColor: AppColors.primary,
                        color: Colors.transparent,
                        highlight: AppColors.primary.withOpacity(0.5),
                        borderColor: AppColors.primary,
                        borderWidth: 4,
                        onClick: () {
                          //     Utils.mainAppNav.currentState.pushNamed('/mainpage');
                          Navigator.pushNamed(context, '/signin');
                        },
                      ),
                    ),),
                ],
              ),
            ),
          )
        ])



      // Container(
      //     color: Colors.black45,
      //     child: Stack(
      //       children: [
      //         Positioned.fill(
      //           child: Opacity(
      //             opacity: 0.3,
      //             child: Image.asset(
      //                 'assets/images/welcome-bg.png',
      //                 fit: BoxFit.cover),
      //           ),
      //         ),
      //         Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.stretch,
      //             children: [
      //               Center(
      //                 child: ClipOval(
      //                   child: Container(
      //                     width: 180,
      //                     height: 180,
      //                     color: AppColors.MAIN_COLOR,
      //                     alignment: Alignment.center,
      //                     child: IconFont(
      //                         iconName: IconFontHelper.MAIN_LOGO,
      //                         color: Colors.white,
      //                         size: 130
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(height: 50),
      //               Text('Bienvenido',
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 40,
      //                       fontWeight: FontWeight.bold
      //                   )
      //               ),
      //               SizedBox(height: 40),
      //               Text('Productos Frescos.\nSaludables. A Tiempo',
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 18
      //                   )
      //               ),
      //               SizedBox(height: 40),
      //               ThemeButton(
      //                 label: 'Home',
      //                 highlight: AppColors.MainColor,
      //                 color: AppColors.primary,
      //                 onClick: () {
      //                   // Utils.mainAppNav.currentState.pushNamed('/mainpage');
      //                 },
      //               ),
      //               ThemeButton(
      //                 label: 'Onboarding',
      //                 highlight: AppColors.MainColor,
      //                 color: AppColors.MainHov,
      //                 onClick: () {
      //                   // Utils.mainAppNav.currentState.pushNamed('/onboardingpage');
      //                 },
      //               ),
      //               ThemeButton(
      //                   label: "Login",
      //                   labelColor: AppColors.primary,
      //                   color: Colors.transparent,
      //                   highlight: AppColors.primary.withOpacity(0.5),
      //                   borderColor: AppColors.primary,
      //                   borderWidth: 4,
      //                   onClick: () {},
      //                   // onClick: () async {
      //                   //   bool success = await loginService.signInWithGoogle();
      //                   //
      //                   //   if (success) {
      //                   //     Utils.mainAppNav.currentState.pushNamed('/mainpage');
      //                   //   }
      //                   // }
      //               )
      //             ],
      //           ),
      //         )
      //       ],
      //     )
      // )
    );
  }
}

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
          message: 'Get\nto notice, public\ngarbage anywhere',
          img: 'onboard1'
      ),
      OnboardingContent(
          message: 'Snap an image\n or video record the area\nthen send to us',
          img: 'onboard2'
      ),
      OnboardingContent(
          message: 'We will take\nnecessary actions so as to\n keep the environment clean',
          img: 'onboard3'
      )
    ];
  }

  static String deviceSuffix(BuildContext context) {
    String deviceSuffix = '';
    TargetPlatform platform = Theme.of(context).platform;
    switch(platform) {
      case TargetPlatform.android:
        deviceSuffix = '_android';
        break;
      case TargetPlatform.iOS:
        deviceSuffix = '_ios';
        break;
      default:
        deviceSuffix = '';
        break;
    }

    return deviceSuffix;
  }
}
class OnboardingContent {
  String message;
  String img;

  OnboardingContent({
    required this.message, required this.img
  });
}
class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        appBar: Navbar(
            title: "Report Founded Garbage",
            backButton: true,
            bgColor: AppColors.primary
        ),
        backgroundColor: AppColors.bgColorScreen,
        body: Text('hello')//SingleChildScrollView(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<OnboardingContent> _content = Utils.getOnboarding();
  int pageIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MainAppBar(),
        body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    child: PageView(
                      controller: _controller,
                      onPageChanged: (int page) {
                        setState(() {
                          pageIndex = page;
                        });
                      },
                      children: List.generate(
                          _content.length,
                              (index) =>
                              Container(
                                  padding: const EdgeInsets.all(40),
                                  margin: const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.primary.withOpacity(0.3),
                                            blurRadius: 20,
                                            offset: Offset.zero
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            // Align(
                                            //   alignment: Alignment.topRight,
                                            //   child: IconFont(
                                            //       color: AppColors.MAIN_COLOR,
                                            //       iconName: IconFontHelper.LOGO,
                                            //       size: 40
                                            //   ),
                                            // ),
                                            Image.asset('assets/images/${_content[index].img}.png'),
                                            const SizedBox(height: 40),
                                            Text(_content[index].message,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 25
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: index == _content.length - 1,
                                        child: ThemeButton(
                                          onClick: () {
                                            // Utils.mainAppNav.currentState.pushNamed('/mainpage');
                                          },
                                          label: 'Go to Home',
                                          color: AppColors.MainColor,
                                          highlight: AppColors.MainHov,
                                        ),
                                      )
                                    ],
                                  )
                              )
                      ),
                    )
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        _content.length,
                            (index) =>
                            GestureDetector(
                              onTap: () {
                                _controller.animateTo(
                                    MediaQuery.of(context).size.width * index,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut
                                );
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 6,
                                        color: pageIndex == index ? AppColors.MainColor : Theme.of(context).canvasColor
                                    )
                                ),
                              ),
                            )
                    )
                ),
                const SizedBox(height: 20),
                ThemeButton(
                    onClick: () {
                      // Utils.mainAppNav.currentState.pushNamed('/mainpage');
                    },
                    label: 'Skip Onboarding'
                )
              ],
            )
        )
    );
  }
}


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Navbar(
            title: "Notifications",
            bgColor: AppColors.primary
        ),
        backgroundColor: AppColors.bgColorScreen,
        drawer: const DrawerNav(currentPage: 'notifications'),
        body: FittedBox(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [ BoxShadow(color: AppColors.muted, blurRadius: 2.0)]),
            child: Column(
              children: const [
                Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: TextStyle(color: AppColors.text)),
                SizedBox(height: 16.0),
                Icon(Icons.notifications), // Image(image: AssetImage(manShoes)),
                SizedBox(height: 16.0),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: TextStyle(color: AppColors.muted)),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('11/Feb/2021 04:42 PM',
                      style: TextStyle(color: AppColors.muted)),
                )
              ],
            ),
          ),
        )
    );
  }
}

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(),
      body: ListView.separated(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) {
            return NotificationCardTiles(
              title: 'Encouragement',
              subtitle: 'We encourage new reports from you,n base on your movement, Thanks',
              enable: true,
              onTap: () => Navigator.of(context).push(
                // ignore: prefer_const_constructors
                  MaterialPageRoute(builder: (context) => NotificationPage())),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          }),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "Home",
          bgColor: AppColors.primary
      ),
      backgroundColor: AppColors.bgColorScreen,
      drawer: const DrawerNav(currentPage: 'home',),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10 ), //top: 15
              child: SafeArea(
                bottom: true,
                child: Column(
                  children: <Widget> [
                    const Text(
                      'Take a Photo\nof any Public Garbage',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Todo Image home
                    SizedBox(
                      height: 120,
                      width: null,
                      child: Card(
                          elevation: 0.1,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4.0))),
                          child: Stack(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/home_default.png"),
                                        fit: BoxFit.cover,
                                      ))),
                              Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.all(Radius.circular(4.0)))),
                            ],
                          )
                      ),
                    ),
                    const RadioButton(),
                    const SizedBox(height: 8),
                    GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 5,
                      children: <Widget>[
                        //TODO : add method to take snapshot here
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: AppColors.success,
                          child: Row(
                            children: <Widget>[
                              Column(children: <Widget>[
                                Row(children: <Widget>[
                                  const Icon(Icons.camera_alt, size: 30, color: AppColors.primary),
                                  //TODO: add a button to walk lik a floating action button either floating action btn or elevated btn
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), //<-- SEE HERE
                                      padding: const EdgeInsets.all(20),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.muted,
                                      size: 24,
                                    ),
                                  ),
                                ],
                                ),
                                const Text('Take a photo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                              ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: AppColors.success,
                          child: Row(
                            children: <Widget>[
                              Column(children: <Widget>[
                                Row(children: <Widget>[
                                  const Icon(Icons.video_camera_back, size: 30, color: AppColors.primary),
                                  //TODO: add a button to walk lik a floating action button either floating action btn or elevated btn
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), //<-- SEE HERE
                                      padding: const EdgeInsets.all(20),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.muted,
                                      size: 22,
                                    ),
                                  ),
                                ],
                                ),
                                const Text('Take a Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                              ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ThemeButton(
                        label: "Continue",
                        color: AppColors.primary,
                        highlight: AppColors.MainColor,
                        onClick: () {
                          Navigator.pushNamed(context, '/report');
                        }
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}


enum GarbageLocation { publicly, homely }
class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  GarbageLocation? _character = GarbageLocation.publicly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Administrative area'),
          leading: Radio<GarbageLocation>(
            activeColor: AppColors.primary,
            value: GarbageLocation.publicly,
            groupValue: _character,
            onChanged: (GarbageLocation? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Residential area'),
          leading: Radio<GarbageLocation>(
            activeColor: AppColors.primary,
            value: GarbageLocation.homely,
            groupValue: _character,
            onChanged: (GarbageLocation? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
        title: "Dashboard",
        bgColor: AppColors.primary,
        // getCurrentPage: ,
      ),
      backgroundColor: AppColors.bgColorScreen,
      drawer: const DrawerNav(currentPage: 'dashboard'),
      body: Container(
        height: 450,
        color: Colors.blue,
        child: const Text('hello dashboard'),
      ),
    );
  }
}


class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "About Us",
          backButton: true,
          bgColor: AppColors.primary
      ),
      backgroundColor: AppColors.bgColorScreen,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5),
              Column(
                  children: const <Widget>[
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                  ]
              ),
              Row(
                children: const <Widget>[
                  //Todo: Add 2 button from the button class found at the wig=dget directory
                ],
              )
            ],
          )
      ),
    );
  }
}

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: const Text('faq'),
    );
  }
}

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "Privacy Policy",
          backButton: true,
          bgColor: AppColors.primary
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5),
              Container(
                child: Column(
                    children: const <Widget>[
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                    ]
                ),
              ),
              Row(
                children: const <Widget>[
                  //Todo: Add 2 button from the button class found at the wig=dget directory
                ],
              )
            ],
          )
      ),
    );
  }
}

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "Terms and Conditions",
          backButton: true,
          bgColor: AppColors.primary
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5),
              Column(
                  children: const <Widget>[
                    ListTile(
                        title: Text('hey'),
                        subtitle: Text('hello')
                    ),
                    DescriptionNotice(text: 'Accumsan lorem mus quisque. Turpis a. Sem lorem. Lacus pharetra dui litora nisl, morbi malesuada vehicula et orci integer at nec dis commodo odio quam hac in orci. Tempus vestibulum maecenas facilisis magnis feugiat libero praesent morbi mattis conubia. Justo dapibus in libero Magnis varius congue Turpis proin morbi netus class erat habitant amet.Proin lacus libero. Donec feugiat ut consectetuer felis. Natoque vel netus. Dictum vitae euismod duis. Rutrum dignissim fermentum lobortis amet taciti venenatis. Nisl aenean tristique habitant cubilia fames mollis. Nostra volutpat nam, tempor diam semper nulla mi molestie volutpat, consequat ultrices facilisi. Erat nibh venenatis hymenaeos urna. Quam. Metus hymenaeos porttitor dictumst. Ac volutpat inceptos risus habitasse. Felis Habitant. Per ac egestas luctus. Id velit odio montes tempus faucibus a enim.Tempor potenti conubia vehicula accumsan fermentum vivamus ridiculus convallis dictumst, eleifend primis scelerisque, platea. Duis nam dignissim laoreet integer pulvinar. Sagittis donec dapibus hac condimentum sapien imperdiet nulla sagittis iaculis suscipit lorem sem sapien turpis morbi morbi nibh blandit lobortis mauris elit. Ac diam tristique. Nonummy bibendum bibendum magnis congue amet cum accumsan mattis justo hendrerit. Dis. At semper quis. Vehicula magnis sollicitudin id potenti quisque. Nascetur nunc justo ligula fringilla molestie porttitor congue non'),
                    DescriptionNotice(text: 'Accumsan lorem mus quisque. Turpis a. Sem lorem. Lacus pharetra dui litora nisl, morbi malesuada vehicula et orci integer at nec dis commodo odio quam hac in orci. Tempus vestibulum maecenas facilisis magnis feugiat libero praesent morbi mattis conubia. Justo dapibus in libero Magnis varius congue Turpis proin morbi netus class erat habitant amet.Proin lacus libero. Donec feugiat ut consectetuer felis. Natoque vel netus. Dictum vitae euismod duis. Rutrum dignissim fermentum lobortis amet taciti venenatis. Nisl aenean tristique habitant cubilia fames mollis. Nostra volutpat nam, tempor diam semper nulla mi molestie volutpat, consequat ultrices facilisi. Erat nibh venenatis hymenaeos urna. Quam. Metus hymenaeos porttitor dictumst. Ac volutpat inceptos risus habitasse. Felis Habitant. Per ac egestas luctus. Id velit odio montes tempus faucibus a enim.Tempor potenti conubia vehicula accumsan fermentum vivamus ridiculus convallis dictumst, eleifend primis scelerisque, platea. Duis nam dignissim laoreet integer pulvinar. Sagittis donec dapibus hac condimentum sapien imperdiet nulla sagittis iaculis suscipit lorem sem sapien turpis morbi morbi nibh blandit lobortis mauris elit. Ac diam tristique. Nonummy bibendum bibendum magnis congue amet cum accumsan mattis justo hendrerit. Dis. At semper quis. Vehicula magnis sollicitudin id potenti quisque. Nascetur nunc justo ligula fringilla molestie porttitor congue non'),
                    DescriptionNotice(text: 'Accumsan lorem mus quisque. Turpis a. Sem lorem. Lacus pharetra dui litora nisl, morbi malesuada vehicula et orci integer at nec dis commodo odio quam hac in orci. Tempus vestibulum maecenas facilisis magnis feugiat libero praesent morbi mattis conubia. Justo dapibus in libero Magnis varius congue Turpis proin morbi netus class erat habitant amet.Proin lacus libero. Donec feugiat ut consectetuer felis. Natoque vel netus. Dictum vitae euismod duis. Rutrum dignissim fermentum lobortis amet taciti venenatis. Nisl aenean tristique habitant cubilia fames mollis. Nostra volutpat nam, tempor diam semper nulla mi molestie volutpat, consequat ultrices facilisi. Erat nibh venenatis hymenaeos urna. Quam. Metus hymenaeos porttitor dictumst. Ac volutpat inceptos risus habitasse. Felis Habitant. Per ac egestas luctus. Id velit odio montes tempus faucibus a enim.Tempor potenti conubia vehicula accumsan fermentum vivamus ridiculus convallis dictumst, eleifend primis scelerisque, platea. Duis nam dignissim laoreet integer pulvinar. Sagittis donec dapibus hac condimentum sapien imperdiet nulla sagittis iaculis suscipit lorem sem sapien turpis morbi morbi nibh blandit lobortis mauris elit. Ac diam tristique. Nonummy bibendum bibendum magnis congue amet cum accumsan mattis justo hendrerit. Dis. At semper quis. Vehicula magnis sollicitudin id potenti quisque. Nascetur nunc justo ligula fringilla molestie porttitor congue non'),
                    DescriptionNotice(text: 'Accumsan lorem mus quisque. Turpis a. Sem lorem. Lacus pharetra dui litora nisl, morbi malesuada vehicula et orci integer at nec dis commodo odio quam hac in orci. Tempus vestibulum maecenas facilisis magnis feugiat libero praesent morbi mattis conubia. Justo dapibus in libero Magnis varius congue Turpis proin morbi netus class erat habitant amet.Proin lacus libero. Donec feugiat ut consectetuer felis. Natoque vel netus. Dictum vitae euismod duis. Rutrum dignissim fermentum lobortis amet taciti venenatis. Nisl aenean tristique habitant cubilia fames mollis. Nostra volutpat nam, tempor diam semper nulla mi molestie volutpat, consequat ultrices facilisi. Erat nibh venenatis hymenaeos urna. Quam. Metus hymenaeos porttitor dictumst. Ac volutpat inceptos risus habitasse. Felis Habitant. Per ac egestas luctus. Id velit odio montes tempus faucibus a enim.Tempor potenti conubia vehicula accumsan fermentum vivamus ridiculus convallis dictumst, eleifend primis scelerisque, platea. Duis nam dignissim laoreet integer pulvinar. Sagittis donec dapibus hac condimentum sapien imperdiet nulla sagittis iaculis suscipit lorem sem sapien turpis morbi morbi nibh blandit lobortis mauris elit. Ac diam tristique. Nonummy bibendum bibendum magnis congue amet cum accumsan mattis justo hendrerit. Dis. At semper quis. Vehicula magnis sollicitudin id potenti quisque. Nascetur nunc justo ligula fringilla molestie porttitor congue non'),
                    DescriptionNotice(text: 'lorem ipsum dolor sit amet ...',),
                    //TODO : add more description
                  ]
              ),
              Row(
                // padding: EdgeInsets.fromLTRB(left, top, right, bottom)
                  children: <Widget>[
                    //Todo: Add 2 button from the button class found at the widget directory
                    ThemeButton(
                        label: "Agree",
                        color: AppColors.primary,
                        highlight: AppColors.MainColor,
                        onClick: () {
                          // Navigator.pushNamed(context, '/report');
                          //TODO : impl route to return to home or back pop  backward
                        }
                    ),
                    ThemeButton(
                        label: "Refuse",
                        color: AppColors.white,
                        highlight: AppColors.MainColor,
                        onClick: () {
                          // Navigator.pushNamed(context, '/report');
                        }
                    )
                  ]
              )
            ],
          )
      ),
    );
  }
}

class AgreementPage extends StatelessWidget {
  const AgreementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "User Agreement",
          backButton: true,
          bgColor: AppColors.primary
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5),
              Container(
                child: Column(
                    children: const <Widget>[
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                      Text('hey'),
                    ]
                ),
              ),
              Row(
                children: const <Widget>[
                  //Todo: Add 2 button from the button class found at the wigdget directory
                ],
              )
            ],
          )
      ),
    );
  }
}

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: SizedBox(
        height: 500,
        child: const Text('feedback'),
      ),
    );
  }
}


class LanguageSupport extends StatefulWidget {
  const LanguageSupport({Key? key}) : super(key: key);

  @override
  State<LanguageSupport> createState() => _LanguageSupportState();
}

class _LanguageSupportState extends State<LanguageSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "Select Language of Preference",
          backButton: true,
          bgColor: AppColors.primary
      ),
      body: SizedBox(
        height: 500,
        child: const Text('lang selector'),
      ),
    );
  }
}

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "Update Profile",
          backButton: true,
          bgColor: AppColors.primary
      ),
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
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/Profile Image.png"),
                    ),
                    Positioned(
                      right: -16,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(color: Colors.white),
                              ),
                              primary: Colors.white,
                              backgroundColor: const Color(0xFFF5F6F9),
                            ),
                            onPressed: () {},
                            child: const Icon(Icons.camera_alt)//SvgPicture.asset("assets/icons/Camera Icon.svg"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //TODO: app forms to update profile info here
              //username,city,phone number etc

            ]
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "Profile",
          bgColor: AppColors.primary
      ),
      backgroundColor: AppColors.bgColorScreen,
      drawer: const DrawerNav(currentPage: 'profile',),
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
                    //TODO : get img from db via http request
                    backgroundImage: AssetImage("assets/images/Profile.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
//Todo: fetch account details and append here!!
            ProfileInfo(
                icon:  const Icon(Icons.account_circle), //Icons.person
                title: "User name",
                onTap: () {
                  // Navigator.pushNamed(context, '/pro');
                }),
            const SizedBox(height: 4),
//Todo: add password here as in design
//Todo:add contact details as in design
            ProfileInfo(
                icon:  const Icon(Icons.email),
                title: "User Email",
                onTap: () {
                  // Navigator.pushNamed(context, '/pro');
                }),
            const SizedBox(height: 4),
            ProfileInfo(
                icon:  const Icon(Icons.phone),
                title: "User contact",
                onTap: () {
                  // Navigator.pushNamed(context, '/pro');
                }),
            const SizedBox(height: 4),
            ProfileInfo(
                icon:  const Icon(Icons.place),
                title: "User Residence",
                onTap: () {
                  // Navigator.pushNamed(context, '/pro');
                }),
            //Todo: add profile update text as in design
            const SizedBox(height: 4),
            ProfileInfo(
                icon:  const Icon(Icons.verified_user),
                title: "Update your profile",
                onTap: () {
                  // Navigator.pushNamed(context, '/pro');
                }),
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
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(
          title: "Complete Profile",
          backButton: true,
          bgColor: AppColors.primary
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  const Text("Complete Profile", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    height: 1.5,
                  ) ),
                  const Text(
                    "Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.06),
                  const CompleteProfileForm(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
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
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          ThemeButton(
            label: 'continue',
            onClick: () {
              if (_formKey.currentState!.validate()) {
                // Navigator.pushNamed(context, '/otpverification';)
                Navigator.pushNamed(context, '/otpverification');
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: addressNullError);
        }
        return ;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: addressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.place),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: phoneNumberNullError);
        }
        return ;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: phoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: nameNullError);
        }
        return ;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: nameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Navbar(
          transparent: true,
          title: "",
          // reverseTextcolor: true,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.bgColorScreen,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                    Text("Register Account", style: headingStyle),
                    const Text(
                      "Complete your details or continue \nwith social media",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    const SignUpForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialCard(
                          icon: const Icon(Icons.sports_soccer_outlined),//FontAwesomeIcons.googlePlus, size: 25.0, color: AppColors.error
                          press: () {}, // google auth
                        ),
                        SocialCard(
                          icon: const Icon(Icons.sports_soccer_outlined), //FontAwesomeIcons.facebook, size: 25.0, color: AppColors.blue
                          press: () {}, // facebook auth
                        ),
                        SocialCard(
                          icon: const Icon(Icons.sports_soccer_outlined),//FontAwesomeIcons.facebook, size: 25.0, color: AppColors.time
                          press: () {}, //apple auth
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirm_password;
  // bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
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
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          const CheckedBox(),
          SizedBox(height: getProportionateScreenHeight(40)),
          ThemeButton(
              label: 'Continue',
              highlight: AppColors.MainColor,
              color: AppColors.primary, //AppColors.MAIN_COLOR,
              onClick: () {
                // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to login screen
                  Navigator.pushNamed(context, '/signin');
                }

              }
          )
        ],
      ),
    );
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.isNotEmpty && password == confirm_password) {
          removeError(error: matchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if ((password != value)) {
          addError(error: matchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock)
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.length >= 8) {
          removeError(error: shortPassError);
        }
        password = value;
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
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock)
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: invalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: invalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.mail)
      ),
    );
  }
}


class CheckedBox extends StatefulWidget {
  const CheckedBox({Key? key}) : super(key: key);


  @override
  State<CheckedBox> createState() => _CheckedBoxState();
}

class _CheckedBoxState extends State<CheckedBox> {
  late bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 4, bottom: 10), //left: 8.0, top: 0, bottom: 16
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: AppColors.primary,
            value: _checkboxValue,
            onChanged: (bool? newValue) => setState(() =>  _checkboxValue = newValue!),
          ),
          GestureDetector(
            // onTap: () => Navigator.pushNamed(
            //     context, ForgotPasswordScreen.routeName),
            onTap: () {
              //send to terms and condition page
            },
            child: const Text(
                "I agree with the terms and conditions",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w200
                )
            ),
          )
        ],
      ),
    );
  }
}


class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
        backgroundColor: AppColors.bgColorScreen,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Sign in with your email and password  \nor continue with social media",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    const SignInForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialCard(
                          icon: const Icon(Icons.sports_soccer_outlined), //FontAwesomeIcons.googlePlus, size: 25.0, color: AppColors.error
                          press: () {}, //google auth
                        ),
                        SocialCard(
                          icon: const Icon(Icons.sports_soccer_outlined), //FontAwesomeIcons.facebook, size: 25.0, color: AppColors.blue
                          press: () {}, //facebook auth
                        ),
                        SocialCard(
                          icon: const Icon(Icons.sports_soccer_outlined), //FontAwesomeIcons.facebook, size: 25.0, color: AppColors.time
                          press: () {}, // apple auth
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                        ),
                        GestureDetector(
                          onTap: (){},// => Navigator.pushNamed(context, SignUpScreen.routeName),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
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
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                // onTap: () => Navigator.pushNamed(
                //     context, ForgotPasswordScreen.routeName),
                onTap: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          // DefaultButton(
          //   text: "Continue",
          //   press: () {
          //     if (_formKey.currentState!.validate()) {
          //       _formKey.currentState!.save();
          //       // if all are valid then go to success screen
          //       KeyboardUtil.hideKeyboard(context);
          //       Navigator.pushNamed(context, LoginSuccessScreen.routeName);
          //     }
          //   },
          // ),
          ThemeButton(
              label: 'Continue',
              highlight: AppColors.MainColor,
              color: AppColors.primary, //AppColors.MAIN_COLOR,
              onClick: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const HomePage()));
                //   // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
              }
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.length >= 8) {
          removeError(error: shortPassError);
        }
        return;
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
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.vpn_key)
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: invalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: invalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.mail)
      ),
    );
  }
}

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: AppColors.bgColorScreen,
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
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Please enter your email and we will send \nyou a link to reset your account password",
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
              highlight: AppColors.MainColor,
              color: AppColors.primary, //AppColors.MAIN_COLOR,
              onClick: () {
                if (_formKey.currentState!.validate()) {
                  // go to forgot password and reset from there
                }
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
                      color: AppColors.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text(
                  "OTP Verification",
                  style: headingStyle,
                ),
                const Text("We sent your code to +237 243 4** ***"),
                buildTimer(),
                const OtpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: const Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          // DefaultButton(
          //   text: "Continue",
          //   press: () {},
          // )
          ThemeButton(
              label: 'Continue',
              highlight: AppColors.MainColor,
              color: AppColors.primary,
              onClick: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const HomePage()));
                //   // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
              }
          )
        ],
      ),
    );
  }
}


Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("This code will expired in "),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0.0),
        duration: const Duration(seconds: 30),
        builder: (_, dynamic value, child) => Text(
          "00:${value.toInt()}",
          style: const TextStyle(color: AppColors.primary),
        ),
      ),
    ],
  );
}

class CompleteRegistration extends StatelessWidget {
  const CompleteRegistration({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        child: const Text('complete profile'),
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const ResetPasswordPage();
    return  const Scaffold(
      appBar: Navbar(
        title: 'Change Password',
        backButton: true,
      ),
      backgroundColor: AppColors.bgColorScreen,
      body: SingleChildScrollView(),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  // String? password;
  // String? confirm_password;
  String? new_password;
  String? confirm_new_password;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
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
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          ThemeButton(
              label: 'Continue',
              highlight: AppColors.MainColor,
              color: AppColors.primary, //AppColors.MAIN_COLOR,
              onClick: () {
                // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to login screen
                  Navigator.pushNamed(context, '/signin');
                }

              }
          )
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_new_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.isNotEmpty && new_password == confirm_new_password) {
          removeError(error: matchPassError);
        }
        confirm_new_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if ((new_password != value)) {
          addError(error: matchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Confirm New Password",
          hintText: "Re-enter New password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock)
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => new_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.length >= 8) {
          removeError(error: shortPassError);
        }
        new_password = value;
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
          labelText: "New Password",
          hintText: "Enter New Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock)
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: invalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: invalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.mail)
      ),
    );
  }
}





























class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _checkboxValue = false;

  final double height = window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Navbar(
          transparent: true,
          title: "",
          // reverseTextcolor: true,
        ),
        extendBodyBehindAppBar: true,
        // drawer: DrawerNav(currentPage: "Account"),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/register-bg.png"),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16.0, right: 16.0, bottom: 32),
                  child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.78,
                          color: AppColors.bgColorScreen,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 24.0, bottom: 8),
                                    child: Center(
                                        child: Text("Register",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      RawMaterialButton(
                                        onPressed: () {},
                                        elevation: 4.0,
                                        // fillColor: AppColors.socialFacebook,
                                        child: Icon(Icons.sports, size: 16.0, color: Colors.blue), //FontAwesomeIcons.facebook,size: 16.0, color: Colors.white
                                        padding: EdgeInsets.all(15.0),
                                        shape: CircleBorder(),
                                      ),
                                      RawMaterialButton(
                                        onPressed: () {},
                                        elevation: 4.0,
                                        // fillColor: AppColors.socialTwitter,
                                        child: const Icon(Icons.sports, size: 16.0, color: Colors.grey), // //FontAwesomeIcons.apple,size: 16.0, color: Colors.white                                       child: Icon(), //
                                        padding: const EdgeInsets.all(15.0),
                                        shape: const CircleBorder(),
                                      ),
                                      RawMaterialButton(
                                        onPressed: () {},
                                        elevation: 4.0,
                                        // fillColor: AppColors.socialDribbble,
                                        child: const Icon(Icons.sports, size: 16.0, color: Colors.red), //FontAwesomeIcons.googleplus, size: 16.0, color: Colors.white
                                        padding: const EdgeInsets.all(15.0),
                                        shape: const CircleBorder(),
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 24.0, bottom: 24.0),
                                    child: Center(
                                      child: Text("or be classical",
                                          style: TextStyle(
                                              color: AppColors.time,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16)),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Input(
                                          placeholder: "Enter Username ...",
                                          prefixIcon: Icon(Icons.person_add, size: 20),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Input(
                                            placeholder: "Enter Email...",
                                            prefixIcon: Icon(Icons.email, size: 20)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0,
                                            left: 8.0,
                                            right: 8.0,
                                            bottom: 0),
                                        child: Input(
                                            placeholder: "Enter Password",
                                            prefixIcon: Icon(Icons.lock, size: 20)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 0, bottom: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Checkbox(
                                                activeColor:
                                                AppColors.primary,
                                                onChanged: (bool? newValue) =>
                                                    setState(() =>
                                                    _checkboxValue =
                                                        newValue!),
                                                value: _checkboxValue
                                            ),
                                            const Text(
                                                "I agree with the terms and conditions",
                                                style: TextStyle(
                                                    color: AppColors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w200
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: RaisedButton(
                                      textColor: AppColors.white,
                                      color: AppColors.primary,
                                      onPressed: () {
                                        // Respond to button press --must reg user user
                                        Navigator.pushReplacementNamed(context, '/home');
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(32.0),
                                      ),
                                      child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 32.0,
                                              right: 32.0,
                                              top: 12,
                                              bottom: 12),
                                          child: Text("Get Started",
                                              style: TextStyle(fontSize: 14.0)
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                ),
              ]),
            )
          ],
        ));
  }
}

















class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkboxValue = false;
   final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final double height = window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Navbar(transparent: true, title: ""),
        extendBodyBehindAppBar: true,
        drawer: const DrawerNav(currentPage: "Account"),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/register-bg.png"),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 24.0, right: 24.0, bottom: 32),
                  child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 0.5,
                                          color: AppColors.muted))),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Text("Sign up with",
                                            style: TextStyle(
                                                color: AppColors.text,
                                                fontSize: 16.0)),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          // width: 0,
                                          height: 36,
                                          child: RaisedButton(
                                              textColor: AppColors.primary,
                                              color: AppColors.secondary,
                                              onPressed: () {},
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(4)),
                                              child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 10,
                                                      top: 10,
                                                      left: 14,
                                                      right: 14),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    children: const [
                                                      Icon(
                                                          Icons.sports,
                                                          size: 13),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("GITHUB",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              fontSize: 13))
                                                    ],
                                                  ))),
                                        ),
                                        SizedBox(
                                          // width: 0,
                                          height: 36,
                                          child: RaisedButton(
                                              textColor: AppColors.primary,
                                              color: AppColors.secondary,
                                              onPressed: () {},
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(4)),
                                              child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 10,
                                                      top: 10,
                                                      left: 8,
                                                      right: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    children: const [
                                                      Icon(Icons.sports, size: 13),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("FACEBOOK",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              fontSize: 13))
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Divider()
                                ],
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.63,
                              color: const Color.fromRGBO(244, 245, 247, 1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 24.0, bottom: 24.0),
                                        child: Center(
                                          child: Text(
                                              "Or sign up with the classic way",
                                              style: TextStyle(
                                                  color: AppColors.text,
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Input(
                                              placeholder: "Name",
                                              prefixIcon: Icon(Icons.school),
                                              // controller: nameController,
                                            )
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Input(
                                                placeholder: "Email",
                                                prefixIcon: Icon(Icons.email),
                                              // controller: emailController,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Input(
                                                placeholder: "Password",
                                                prefixIcon: Icon(Icons.lock),
                                              // controller: passwordController,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 24.0),
                                            child: RichText(
                                                text: const TextSpan(
                                                    text: "password strength: ",
                                                    style: TextStyle(
                                                        color:
                                                        AppColors.muted),
                                                    children: [
                                                      TextSpan(
                                                          text: "strong",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              color: AppColors
                                                                  .success))
                                                    ])),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 0, bottom: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Checkbox(
                                                activeColor:
                                                AppColors.primary,
                                                onChanged: (bool? newValue) =>
                                                    setState(() =>
                                                    _checkboxValue =
                                                        newValue!),
                                                value: _checkboxValue),
                                            const Text("I agree with the",
                                                style: TextStyle(
                                                    color: AppColors.muted,
                                                    fontWeight:
                                                    FontWeight.w200)),
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, '/pro');
                                                },
                                                child: Container(
                                                  margin:
                                                  const EdgeInsets.only(left: 5),
                                                  child: const Text("Privacy Policy",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primary)),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: Center(
                                          child: FlatButton(
                                            textColor: AppColors.white,
                                            color: AppColors.primary,
                                            onPressed: () {
                                              // Respond to button press
                                              Navigator.pushNamed(
                                                  context, '/home');
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(4.0),
                                            ),
                                            child: const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.0,
                                                    right: 16.0,
                                                    top: 12,
                                                    bottom: 12),
                                                child: Text("REGISTER",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontSize: 16.0))),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )),
                ),
              ]),
            )
          ],
        ));
  }
}