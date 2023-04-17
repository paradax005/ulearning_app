import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildPage(_index),
      ),
      bottomNavigationBar: Container(
        width: 375.w,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h),
            topRight: Radius.circular(20.h),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryElement,
          unselectedItemColor: AppColors.primaryFourthElementText,
          currentIndex: _index,
          elevation: 0,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/home.png",
                ),
              ),
              activeIcon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/home.png",
                  color: AppColors.primaryElement,
                ),
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/search.png",
                ),
              ),
              activeIcon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/search.png",
                  color: AppColors.primaryElement,
                ),
              ),
              label: "search",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/play-circle.png",
                ),
              ),
              activeIcon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/play-circle.png",
                  color: AppColors.primaryElement,
                ),
              ),
              label: "course",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/message-circle.png",
                ),
              ),
              activeIcon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/message-circle.png",
                  color: AppColors.primaryElement,
                ),
              ),
              label: "message",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/person.png",
                ),
              ),
              activeIcon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  "assets/icons/person.png",
                  color: AppColors.primaryElement,
                ),
              ),
              label: "profile",
            ),
          ],
        ),
      ),
    );
  }
}
