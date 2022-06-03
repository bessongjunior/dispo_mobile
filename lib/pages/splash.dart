import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
 // const SplashPage({Key? key}) : super(key: key);
  int duration = 0;
  Widget goToPage;

  SplashPage({Key? key, required this.duration, required this.goToPage}) : super(key : key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds:duration), ()=> Navigator.push(
        context, MaterialPageRoute(builder: (context)=> goToPage)
    ));
    return Material(
        child: Container(
            color: Colors.deepPurple,//AppColors.MAIN_COLOR,
            alignment: Alignment.center,
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.accessibility),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}
