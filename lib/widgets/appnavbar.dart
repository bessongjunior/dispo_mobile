// ignore_for_file: unnecessary_null_comparison, prefer_is_empty, import_of_legacy_library_into_null_safe
import 'package:dispo_mobile_app/services/auth_services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:dispo_mobile_app/utils/appcolor.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  final bool transparent;
  final VoidCallback? getCurrentPage;
  final bool noShadow;
  final Color bgColor;

  const Navbar({Key? key,
        this.title = "Home",
        this.transparent = false,
        this.getCurrentPage,
        this.backButton = false,
        this.noShadow = false,
        this.bgColor = AppColors.white,
  }) : super(key: key);

  final double _prefferedHeight = 45.0;

  // String get accesstoken => "";
  //
  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {


  // final ApiClient _apiClient = ApiClient();
  // Future<void> logout() async {
  //   await _apiClient.logout(widget.accesstoken);
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  // }

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? AppColors.initial
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: const Offset(0, 5))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                                !widget.backButton
                                    ? Icons.menu
                                    : Icons.arrow_back_ios,
                                color: !widget.transparent
                                    ? (widget.bgColor == AppColors.white
                                    ? AppColors.initial
                                    : AppColors.white)
                                    : AppColors.white,
                                size: 24.0),
                            onPressed: () {
                              if (!widget.backButton) {
                                Scaffold.of(context).openDrawer();
                              } else {
                                Navigator.pop(context);
                              }
                            }),
                        Text(widget.title,
                            style: TextStyle(
                                color: !widget.transparent
                                    ? (widget.bgColor == AppColors.white
                                    ? AppColors.initial
                                    : AppColors.white)
                                    : AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0)),
                      ],
                    ),
                    // if (widget.rightOptions)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/notifications');
                            },
                            child: IconButton(
                                icon: Icon(Icons.notifications_active,
                                    color: !widget.transparent
                                        ? (widget.bgColor == AppColors.white
                                        ?  AppColors.initial
                                        :  AppColors.white)
                                        :  AppColors.white,
                                    size: 22.0),
                                onPressed: null),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/language');
                            },
                            child: IconButton(
                                icon: Icon(Icons.flag,
                                    color: !widget.transparent
                                        ? (widget.bgColor ==  AppColors.white
                                        ?  AppColors.initial
                                        :  AppColors.white)
                                        :  AppColors.white,
                                    size: 22.0),
                                onPressed: null),
                          ),
                        ],
                      )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

