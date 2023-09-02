import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/res/media_res.dart';
import 'package:ulearning_app/pages/home/home.dart';

import '../../common/res/colors.dart';

Widget buildPage(int index) {
  List<Widget> widgets = const [
    HomePage(),
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
        iconName,
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        iconName,
        color: AppColors.primaryElement,
      ),
    ),
    label: label,
  );
}

var bottomTabs = [
  bottomTabsItem(MediaRes.home, "Home"),
  bottomTabsItem(MediaRes.search, "Search"),
  bottomTabsItem(MediaRes.playCircle, "Course"),
  bottomTabsItem(MediaRes.messageCircle, "Chat"),
  bottomTabsItem(MediaRes.person, "Profile"),
];
