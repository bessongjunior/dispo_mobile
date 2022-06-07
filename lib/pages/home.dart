import 'package:flutter/material.dart';
import 'package:dispo_mobile/widgets/getimage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Container(  //To Do:  add text and image below as in design
              child: Column(
                children: <Widget>[
                  const Text(''),
                  Container(child: Image.asset('assets/images/home.png'))
                ],
              ),
            ),
            Container( //To Do: radio button for either home or public

            ),
            Container(
               //To Do: take pic and take video
              child: Row(
                children: <Widget>[
                  Container(),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
