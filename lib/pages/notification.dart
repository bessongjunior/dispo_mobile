import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar:  CupertinoNavigationBar(
          trailing: Icon(CupertinoIcons.trash),
          middle: Text('Notification'),
          leading: Icon(CupertinoIcons.bars),
        ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        // scrollDirection: Axis.vertical,
        child: Center( child: Text('notification'),),
      ),
    );
  }
}
