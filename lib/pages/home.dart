import 'package:flutter/material.dart';
// import 'package:dispo_mobile/widgets/getimage.dart';

// ignore: must_be_immutable
class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

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
              child: const RadioButton(),
            ),
            const SizedBox(height: 10),
            Container(
               //To Do: take pic and take video
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue[400],
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.camera_alt, size: 25, color: Colors.deepPurple),
                        // ToDO: add circle with plus sign as btn to get picture on tab, then add text to say get picture!! add all in container.
                        Container()
                      ],
                    ),
                    // const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue[500],
                    child: const Text('Heed not the rabble'),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Colors.teal[300],
                  //   child: const Text('Sound of screams but the'),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Colors.teal[400],
                  //   child: const Text('Who scream'),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Colors.teal[500],
                  //   child: const Text('Revolution is coming...'),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Colors.teal[600],
                  //   child: const Text('Revolution, they...'),
                  // ),
                ],
              )


              // Row(
              //   children: <Widget>[
              //     Container(),
              //     Container()
              //   ],
              // ),
            )
          ],
        ),
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
          title: const Text('Public base'),
          leading: Radio<GarbageLocation>(
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
          title: const Text('Home base'),
          leading: Radio<GarbageLocation>(
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



