import 'package:flutter/material.dart';
// import 'package:dispo_mobile/widgets/getimage.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text('Take a Photo or Video of\n Waste or Garbage any time\n Or anywhere', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400) ),
                Center(
                    child: Image.asset('assets/images/home.png', height: 60,) //height and width props
                )
              ],
            ),
            const RadioButton(),
            const SizedBox(height: 10),
            GridView.count(
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
                          const Icon(Icons.camera_alt, size: 30, color: Colors.deepPurple),
                          //TODO: add a button to walk lik a floating action button either floating action btn or elevated btn
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(), //<-- SEE HERE
                              padding: const EdgeInsets.all(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
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
                          const Icon(Icons.video_camera_back, size: 30, color: Colors.deepPurple),
                          //TODO: add a button to walk lik a floating action button either floating action btn or elevated btn
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(), //<-- SEE HERE
                              padding: const EdgeInsets.all(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        ],
                        ),
                        const Text('Take a short Video', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ],
                      ),
                    ],
                  ),
                ),
              ],
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



