import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),  //modify to all
        child: Column(
          children: <Widget>[
            Container(), // To Do: show taken pic.
            Container(), // To Do: Display auto ml Result from image.
            Container() // To Do: Button to send info to db and admin dashboard.
          ],
        ),
      ),
    );
  }
}
