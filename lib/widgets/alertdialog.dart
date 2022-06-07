import'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  const Dialogs({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(32.0),
        children: <Widget>[
    ////// Alert dialog.
    RaisedButton(
    color: Colors.tealAccent,
        child: const Text('Alert Dialog'),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                title: const Text('Dialog title'),
                content: const Text(
                  'Örnek alert',
                ),
                actions: <Widget>[
            FlatButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, 'Cancel'),
          ),
          FlatButton(
          child: const Text('OK'),
          // child: const Text('OK'),
          onPressed: () => Navigator.pop(context, 'OK'),
          ),
          ],
          ),
          ).then((returnVal) {
          if (returnVal != null) {
          Scaffold.of(context).showSnackBar(
          SnackBar(
          content: Text('You clicked: $returnVal'),
          action: SnackBarAction(label: 'OK', onPressed: () {}),
          ),
          );
          }
          });
        }),
    ]
    );
  }
}