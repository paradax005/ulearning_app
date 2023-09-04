import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/res/colors.dart';
import 'package:ulearning_app/common/res/media_res.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/widgets/base_text.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 12.h,
            width: 18.w,
            child: Image.asset(MediaRes.menu),
          ),
          reusableText('Profile'),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset(MediaRes.moreVertical),
          ),
        ],
      ),
    ),
  );
}

Widget profileHeader() {
  return Container(
    width: 80.w,
    height: 80.h,
    padding: EdgeInsets.only(right: 3.w),
    alignment: Alignment.bottomRight,
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage(MediaRes.headPic),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage(MediaRes.edit3),
    ),
  );
}

// Setting section buttons
var profileInfo = <String, String>{
  'Settings': MediaRes.settings,
  'Payment Detail': MediaRes.creditCard,
  'Achievement': MediaRes.award,
  'Love': MediaRes.heart1,
  'Learning Reminders': MediaRes.cube,
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        profileInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(profileInfo.values.elementAt(index)),
                ),
                SizedBox(width: 20.w),
                Text(
                  profileInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
