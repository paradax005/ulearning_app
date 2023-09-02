import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/res/colors.dart';
import 'package:ulearning_app/common/res/media_res.dart';
import 'package:ulearning_app/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_event.dart';
import 'package:ulearning_app/pages/home/bloc/home_state.dart';

AppBar buildAppBar() {
  return AppBar(
    title: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset(MediaRes.menu),
          ),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(MediaRes.person),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// Reusable Text
Widget homePageText(String text, {Color color = AppColors.primaryText, double top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// Search View
Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.w,
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourthElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset(MediaRes.search),
            ),
            Container(
              width: 230.w,
              child: TextField(
                autocorrect: false,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'search your course',
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
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(5.w),
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(14.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset(
            MediaRes.option,
          ),
        ),
      )
    ],
  );
}

// sliders
Widget slidersView(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 170.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBloc>().add(HomeDots(value));
          },
          children: [
            _sliderItem(),
            _sliderItem(imagePath: MediaRes.slider1),
            _sliderItem(imagePath: MediaRes.slider2),
          ],
        ),
      ),
      SizedBox(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5),
            activeSize: const Size(17, 5),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _sliderItem({String imagePath = MediaRes.art}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableSubTitleText('Choose your course'),
            GestureDetector(
              onTap: () {},
              child: _reusableSubTitleText(
                'See all',
                color: AppColors.primaryThirdElementText,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText('All'),
            _reusableMenuText(
              'Popular',
              foregroundColor: AppColors.primaryBackground,
              textColor: AppColors.primaryThirdElementText,
            ),
            _reusableMenuText(
              'Newest',
              foregroundColor: AppColors.primaryBackground,
              textColor: AppColors.primaryThirdElementText,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableSubTitleText(
  String text, {
  Color color = AppColors.primaryText,
  int fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
}) =>
    SizedBox(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
        ),
      ),
    );

Widget _reusableMenuText(
  String menuText, {
  Color foregroundColor = AppColors.primaryElement,
  Color textColor = AppColors.primaryElementText,
}) =>
    Container(
      margin: EdgeInsets.only(right: 20.w),
      padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 15.w),
      decoration: BoxDecoration(
        color: foregroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: foregroundColor),
      ),
      child: _reusableSubTitleText(
        menuText,
        color: textColor,
        fontSize: 11,
        fontWeight: FontWeight.normal,
      ),
    );

Widget silverGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        image: AssetImage(MediaRes.slider2),
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Visual identity",
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
            fontSize: 11.sp,
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          "30 lessons",
          maxLines: 1,
          style: TextStyle(
            fontSize: 8.sp,
            color: AppColors.primaryFourthElementText,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
