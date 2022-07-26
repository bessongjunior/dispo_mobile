import 'package:flutter/material.dart';
import 'package:dispo_mobile_app/utils/appcolor.dart';


class Input extends StatelessWidget {
  final String placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final Function? onChanged;  //Function onChanged
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;

  const Input({Key? key,
        required this.placeholder,
        this.suffixIcon,
        this.prefixIcon,
        this.onTap,
        this.onChanged,
        this.autofocus = false,
        this.borderColor = AppColors.border,
        this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: AppColors.muted,
        onTap: onTap!,
        // onChanged: onChanged as Function()?,
        controller: controller,
        autofocus: autofocus,
        style:
        const TextStyle(height: 0.85, fontSize: 14.0, color: AppColors.initial),
        textAlignVertical: const TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintStyle: const TextStyle(
              color: AppColors.muted,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon!,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder)
        // onChanged: onChanged,,
    );
  }
}
