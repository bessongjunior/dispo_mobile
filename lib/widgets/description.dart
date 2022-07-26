import 'package:flutter/material.dart';
import 'package:dispo_mobile_app/utils/appcolor.dart';

class DescriptionNotice extends StatelessWidget {
  final String text;
  const DescriptionNotice({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10.0, horizontal: 16.0),
      child: Text(text, style: const TextStyle(fontSize: 18.0, color: AppColors.text,)),
    );
  }
}