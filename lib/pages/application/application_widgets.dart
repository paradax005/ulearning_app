import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> widgets = const [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Course')),
    Center(child: Text('Chat')),
    Center(child: Text('Profile')),
  ];

  return widgets[index];
}

BottomNavigationBarItem bottomTabsItem(String iconName, String label) {
  return BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/$iconName.png",
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/$iconName.png",
        color: AppColors.primaryElement,
      ),
    ),
    label: label,
  );
}

var bottomTabs = [
  bottomTabsItem("home", "Home"),
  bottomTabsItem("search", "Search"),
  bottomTabsItem("play-circle", "Course"),
  bottomTabsItem("message-circle", "Chat"),
  bottomTabsItem("person", "Profile"),
];
