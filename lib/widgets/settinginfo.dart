// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:dispo_mobile_app/utils/appcolor.dart';

class SettingsInfo extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  Widget? icon;

  SettingsInfo({Key? key,required this.icon, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon!,
            Text(title, style: const TextStyle(color: AppColors.text)),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_forward_ios,
                  color: AppColors.text, size: 14),
            )
          ],
        ),
      ),
    );
  }
}
