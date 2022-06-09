import 'package:flutter/material.dart';
// import 'package:dispo_mobile/widgets/getimage.dart';

// ignore: must_be_immutable
class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  // ValueSite _site = valueSite.test;
  //
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
              child: Column(
                children: const <Widget>[
                  ListTile(
                    title: Text(''),
                    // leading: Radio(value: valueSite.test, groupValue: _site, onChanged: (ValueSite value){setSTATE((){_site = value;});},),
                  ),
                  ListTile(),
                  ListTile()
                ],
              ),
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


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueSite _site = valueSite.test;

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
            const SizedBox(height: 10),
            Container( //To Do: radio button for either home or public
              child: Column(
                children: const <Widget>[
                  ListTile(
                    title: Text(''),
                    leading: Radio(value: valueSite.test, groupValue: _site, onChanged: (ValueSite value){setState((){_site = value;});},),
                  ),
                  ListTiclass ValueSite {

}le(
                    title: Text(''),
                    leading: Radio(value: value,
                                    groupValue: groupValue,
                                    onChanged: () {setState( (){

                                    });
                                                  },
                              ),
                  ),
                  // ListTile(title: Text(''),
                  //   leading: Radio(value: value,
                  //     groupValue: groupValue,
                  //     onChanged: () {setState( (){
                  //
                  //     });
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              //To Do: take pic and take video
              child: Row(
                children: <Widget>[
                  Container(
                    child: const Card(),
                  ),
                  Container(
                    child: const Card(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



