import 'package:dispo_mobile/pages/home.dart';
import 'package:dispo_mobile/pages/login.dart';
import 'package:dispo_mobile/pages/onboarding.dart';
import 'package:dispo_mobile/widgets/themebutton.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                      'assets/images/main_bg.png',
                      fit: BoxFit.cover),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 180,
                          height: 180,
                          color: Colors.deepPurple, //AppColors.MAIN_COLOR,
                          alignment: Alignment.center,
                          child: const Icon(Icons.account_balance_sharp, size: 130,) //app logo
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('Welcome/a',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    const SizedBox(height: 40),
                    const Text('Lorem ipsum dolor.\nSit amet. Consectateur',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        )
                    ),
                    const SizedBox(height: 40),
                    ThemeButton(
                      label: 'Skip to Home.',
                      highlight: Colors.purple[900],
                      color: Colors.deepPurple, //AppColors.MAIN_COLOR,
                      onClick: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const HomePage()));
                        // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                      },
                    ),
                    ThemeButton(
                      label: 'View Onboarding',
                      highlight: Colors.purple[900],
                      color: const Color(0xFF5B3B9B), //AppColors.DARK_GREEN,
                      onClick: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const OnboardingPage()));
                        // Utils.mainAppNav.currentState!.pushNamed('/onboardingpage');
                      },
                    ),
                    ThemeButton(
                      // icon: Icon(Icon.google),
                        label: "Login with Google",
                        labelColor: Colors.deepPurple,//AppColors.MAIN_COLOR,
                        color: Colors.transparent,
                        highlight: Colors.deepPurple.withOpacity(0.5),//AppColors.MAIN_COLOR.withOpacity(0.5),
                        borderColor: Colors.deepPurple,//AppColors.MAIN_COLOR,
                        borderWidth: 4,
                        onClick: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const LogInPage()));
                        }
                    )
                  ],
                ),
              )
            ],
          )
      )
    );
  }
}
