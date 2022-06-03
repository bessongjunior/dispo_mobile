import 'package:flutter/material.dart';
import 'package:dispo_mobile/pages/splash.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(goToPage: const WelcomePage(), duration: 4)));
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: const Text('hello to you'),
        ),
      ),
    );
  }
}




// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//         // title: 'Flutter App',
//         home: SplashPage(goToPage: const WelcomePage(), duration: 4)));
//     );
//   }
// }
//
//
// class WelcomePage extends StatefulWidget {
//   const WelcomePage({Key? key}) : super(key: key);
//
//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }
//
// class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Text('hello');
//   }
// }
//

