// ignore_for_file: library_private_types_in_public_api

import 'package:dispo_mobile/pages/home.dart';
import 'package:flutter/material.dart';

import '../pages/Dashboard.dart';
import '../pages/profile.dart';
import '../pages/setting.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String title = 'BottomNavigationBar';

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const <Widget>[
          HomePages(),
          ProfilePage(),
          DashboardPage(),
          SettingPage(),
          // More(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
          child: Container(
            color: Colors.black26,
            child: TabBar(
              labelColor: const Color(0xFFC41A3B),
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 10.0),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black54, width: 0.0),
                insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
              //For Indicator Show and Customization
              indicatorColor: Colors.black54,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(
                    Icons.person_pin,
                    size: 24.0,
                  ),
                  text: 'Profile',
                ),
                Tab(
                  icon: Icon(
                    Icons.stacked_bar_chart,
                    size: 24.0,
                  ),
                  text: 'Dashboard',
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                    size: 24.0,
                  ),
                  text: 'Setting',
                ),
                Tab(
                  icon: Icon(
                    Icons.notification_important,
                    size: 24.0,
                  ),
                  text: 'Notification',
                ),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}