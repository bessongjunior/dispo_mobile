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

//Custom dialog for both ios and android

class AlertDialogTheme extends StatelessWidget {
  const AlertDialogTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//
// const AlertDialog({
// Key? key,
// this.title,
// this.titlePadding,
// this.titleTextStyle,
// this.content,
// this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
// this.contentTextStyle,
// this.actions,
// this.actionsPadding = EdgeInsets.zero,
// this.actionsAlignment,
// this.actionsOverflowAlignment,
// this.actionsOverflowDirection,
// this.actionsOverflowButtonSpacing,
// this.buttonPadding,
// this.backgroundColor,
// this.elevation,
// this.semanticLabel,
// this.insetPadding = _defaultInsetPadding,
// this.clipBehavior = Clip.none,
// this.shape,
// this.alignment,
// this.scrollable = false,
// }) : assert(contentPadding != null),
// assert(clipBehavior != null),
// super(key: key);