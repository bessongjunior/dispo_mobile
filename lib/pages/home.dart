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
               //ToDo: take pic and take video method to be added
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
                        Column(children: <Widget>[
                          Row(children: <Widget>[
                            const Icon(Icons.camera_alt, size: 25, color: Colors.deepPurple),
                            //TODO: add a button to walk lik a floating action button either floating action btn or elevated btn
                            FloatingActionButton(
                              onPressed: () {},
                              // tooltip: 'Increment',
                              child: const Icon(Icons.add),
                            )
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Icon( //<-- SEE HERE
                            //     Icons.train,
                            //     color: Colors.black,
                            //     size: 54,
                            //   ),
                            //   style: ElevatedButton.styleFrom(
                            //     shape: CircleBorder(), //<-- SEE HERE
                            //     padding: EdgeInsets.all(20),
                            //   ),
                            // ),
                          ],
                          ),
                          const Text('Take an image or photo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                        ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue[500],
                    child: Row(
                      children: <Widget>[
                        Column(children: <Widget>[
                          Row(children: <Widget>[
                            const Icon(Icons.video_camera_back, size: 25, color: Colors.deepPurple),
                            //TODO: add a button to walk lik a floating action button either floating action btn or elevated btn
                            FloatingActionButton(
                              onPressed: () {},
                              // tooltip: 'Increment',
                              child: const Icon(Icons.add),
                            )
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Icon( //<-- SEE HERE
                            //     Icons.train,
                            //     color: Colors.black,
                            //     size: 54,
                            //   ),
                            //   style: ElevatedButton.styleFrom(
                            //     shape: CircleBorder(), //<-- SEE HERE
                            //     padding: EdgeInsets.all(20),
                            //   ),
                            // ),
                          ],
                          ),
                          const Text('Take a short Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                        ],
                        ),
                      ],
                    ),
                  ),
                ],
              )

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



