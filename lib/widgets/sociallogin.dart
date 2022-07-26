import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dispo_mobile/utils/sizeconfig.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final Widget? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as Function()?,
      child: Container(
        margin:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: const BoxDecoration(
          color:AppColors.white,
          shape: BoxShape.circle,
        ),
        child: icon // SvgPicture.asset(icon!),
      ),
    );
  }
}
