import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        // height define the thickness of the line
        height: 1,
        color: AppColors.primarySecondaryBackground,
      ),
    ),
    title: Text(
      "Log In",
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _socialIcon('google'),
        _socialIcon('apple'),
        _socialIcon('facebook'),
      ],
    ),
  );
}

Widget _socialIcon(String path) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$path.png"),
    ),
  );
}

Widget textUtil(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(.8),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField({
  required String hintText,
  bool obscureText = false,
  required String iconName,
  required void Function(String value)? function,
}) {
  return Container(
    height: 50.h,
    width: 310.w,
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: BorderRadius.all(
        Radius.circular(15.w),
      ),
      border: Border.all(color: AppColors.primaryFourthElementText),
    ),
    child: Row(
      children: [
        Container(
          width: 20.w,
          height: 20.w,
          margin: EdgeInsets.only(left: 15.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => function,
            keyboardType: TextInputType.emailAddress,
            obscureText: obscureText,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    padding: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 12.sp,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegisterButton(String buttonText, String buttonType) {
  return Container(
    margin: EdgeInsets.only(
      left: 25.w,
      right: 25.w,
      top: buttonType == "login" ? 50.h : 20.h,
    ),
    width: 310.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: buttonType == "login"
          ? AppColors.primaryElement
          : AppColors.primaryBackground,
      borderRadius: BorderRadius.all(
        Radius.circular(15.w),
      ),
      border: buttonType == "register"
          ? Border.all(
              color: AppColors.primaryFourthElementText,
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.7),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Center(
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: buttonType == "login"
              ? AppColors.primaryBackground
              : AppColors.primaryText,
        ),
      ),
    ),
  );
}
