import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Container(), //To Do:  add text and image below to take a pic
            Container(), //To Do: radio button for either home or public
            Container(
               //To Do: take pic and take video
            )
          ],
        ),
      ),
    );
  }
}
