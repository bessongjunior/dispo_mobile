import 'package:flutter/material.dart';

import 'package:dispo_mobile_app/utils/appcolor.dart';

class DrawerNavTile extends StatelessWidget {
  final String title;
  final IconData icon;
  // final Function? onTap;
  final VoidCallback? onTap;
  final bool isSelected;
  final Color iconColor;

  const DrawerNavTile({Key? key,
  required this.title,
  required this.icon,
  required this.onTap,
  this.isSelected = false,
  this.iconColor = AppColors.text
  }) : super(key: key);

  // DrawerNavTile(
  //     { Key? key,
  //       this.title,
  //       this.icon,
  //       this.onTap,
  //       this.isSelected = false,
  //       this.iconColor = AppColors.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Icon(icon,
                  size: 20, color: isSelected ? AppColors.white : iconColor),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title,
                    style: TextStyle(
                        letterSpacing: .3,
                        fontSize: 15,
                        color: isSelected
                            ? AppColors.white
                            : const Color.fromRGBO(0, 0, 0, 0.7))),
              )
            ],
          )),
    );
  }
}
