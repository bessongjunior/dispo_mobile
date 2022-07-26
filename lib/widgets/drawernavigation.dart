import 'package:flutter/material.dart';
import 'package:dispo_mobile_app/utils/appcolor.dart';
import 'package:dispo_mobile_app/widgets/drawernavigation-tiles.dart';

class DrawerNav extends StatelessWidget {
  final String currentPage;

  const DrawerNav({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: AppColors.white,
          child: Column(children: [
            // ignore: sized_box_for_whitespace
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.85,
                child: SafeArea(
                  bottom: false,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Image.asset("assets/images/dispo-logo.png",), // fit: BoxFit.fitWidth,
                    ),
                  ),
                )
            ),
            Expanded(
              flex: 2,
              child: ListView(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                children: [
                  DrawerNavTile(
                      icon: Icons.home,
                      onTap: () {
                        if (currentPage != "home") {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      iconColor: AppColors.primary,
                      title: "Home",
                      isSelected: currentPage == "home" ? true : false),
                  DrawerNavTile(
                      icon: Icons.person,
                      onTap: () {
                        if (currentPage != "Profile") {
                          Navigator.pushReplacementNamed(context, '/profile');
                        }
                      },
                      iconColor: AppColors.warning,
                      title: "Profile",
                      isSelected: currentPage == "profile" ? true : false),
                  DrawerNavTile(
                      icon: Icons.settings,
                      onTap: () {
                        if (currentPage != "setting") {
                          Navigator.pushReplacementNamed(context, '/setting');
                        }
                      },
                      iconColor: AppColors.info,
                      title: "Settings",
                      isSelected: currentPage == "setting" ? true : false),
                  DrawerNavTile(
                      icon: Icons.dashboard,
                      onTap: () {
                        if (currentPage != "dashboard") {
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        }
                      },
                      iconColor: AppColors.error,
                      title: "Dashboard",
                      isSelected: currentPage == "dashboard" ? true : false),
                  DrawerNavTile(
                      icon: Icons.notifications,
                      onTap: () {
                        if (currentPage != "notifications") {
                          Navigator.pushReplacementNamed(context, '/notifications');
                        }
                      },
                      iconColor: AppColors.primary,
                      title: "Notifications",
                      isSelected: currentPage == "notifications" ? true : false),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(height: 5, thickness: 0, color: AppColors.muted),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                        child: Text("ACCOUNT RELATED",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 15,
                            )),
                      ),
                      //TODO : implement logout functionality
                      DrawerNavTile(
                          icon: Icons.security,
                          onTap: () {
                            if (currentPage != "profileupdate") {
                              // Navigator.pushReplacementNamed(context, '/updateprofile');
                              Navigator.pushNamed(context, '/profileupdate');
                            }
                          },
                          iconColor: AppColors.muted,
                          title: "Update Profile",
                          isSelected: currentPage == "profileupdate" ? true : false
                      ),
                      DrawerNavTile(
                        icon: Icons.logout,
                        onTap: () {
                          if (currentPage != "logout") {
                            Navigator.pushReplacementNamed(context, '/welcomepage');
                          }
                        },
                        iconColor: AppColors.muted,
                        title: "Logout",
                        // isSelected: currentPage == "logout" ? true : false
                      ),
                    ],
                  )),
            ),
          ]),
        ));
  }
}
