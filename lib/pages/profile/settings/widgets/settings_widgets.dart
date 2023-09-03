import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/res/colors.dart';
import 'package:ulearning_app/common/res/media_res.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text(
      'Settings',
      style: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    ),
  );
}

Widget logoutButton({required BuildContext context, required void Function()? onPressed}) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Confirm Logout'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text('Confirm'),
              )
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(MediaRes.logout),
          fit: BoxFit.fitHeight,
        ),
      ),
    ),
  );
}
