import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/constants/constant.dart';
import 'package:ulearning_app/common/res/colors.dart';
import 'package:ulearning_app/pages/profile/widgets/profile_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: AppConstants.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileHeader(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
