// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:dispo_mobile_app/utils/appcolor.dart';

class NotificationCardTiles extends StatelessWidget {
  const NotificationCardTiles({Key? key, required this.title, required this.subtitle, this.onTap, required this.enable}) : super(key: key);

  final String title, subtitle;
  final VoidCallback? onTap;
  final bool enable;

  @override
  Widget build(BuildContext context){
    return Card(
        child: ListTile(
          leading: const SizedBox(
            height: 50.0,
            width: 50.0,
            child: Icon(Icons.notifications, size: 50,),
          ),
          title: Text(title, style: const TextStyle(color: AppColors.text)),
          subtitle: Text(subtitle,
              style: const TextStyle(color: AppColors.muted)),
          onTap: onTap!,
          enabled: enable,
        ),
    );
  }
}

