import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/routes/routes.dart';
import '../../common/values/constant.dart';
import '../../common/values/colors.dart';
import '../../global.dart';

import 'bloc/welcome_bloc.dart';
import 'bloc/welcome_events.dart';
import 'bloc/welcome_states.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    state.page = value;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      0,
                      context,
                      "next",
                      "First See Learning",
                      'Forgot about a four of paper all knowledge in one learning',
                      'assets/images/reading.png',
                    ),
                    _page(
                      1,
                      context,
                      "next",
                      "Connect with Everyone",
                      'Always keep in touch with your tutor and friend. let\'s get connected ',
                      'assets/images/boy.png',
                    ),
                    _page(
                      2,
                      context,
                      "Get Started",
                      "Always Fascinated Learning",
                      'Anywhere, anytime. The time is at your discretion so study whenever you want.',
                      'assets/images/man.png',
                    ),
                  ],
                ),
                Positioned(
                  bottom: 80.h,
                  child: DotsIndicator(
                    position: state.page.toDouble(),
                    mainAxisAlignment: MainAxisAlignment.center,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: AppColors.primaryThirdElementText,
                      activeColor: AppColors.primaryElement,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 2) {
              // animation
              pageController.animateToPage(
                index + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              // Jump to new page

              Global.storageService.writeBoolInStorage(
                  AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);

              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 2,
                    spreadRadius: 4,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: AppColors.primaryBackground,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
