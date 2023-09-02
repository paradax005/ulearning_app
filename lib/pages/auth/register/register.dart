import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/res/media_res.dart';
import 'package:ulearning_app/pages/auth/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/auth/register/register_controller.dart';

import './bloc/register_blocs.dart';
import './bloc/register_states.dart';
import '../../../common/res/colors.dart';
import '../common_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryBackground,
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: textUtil("Enter your details below & free sign up"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textUtil("User name"),
                      buildTextField(
                        hintText: "Enter your user name",
                        iconName: MediaRes.user,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(UserNameEvent(value));
                        },
                      ),
                      textUtil("Email"),
                      buildTextField(
                        hintText: "Enter your email address",
                        iconName: MediaRes.user,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value));
                        },
                      ),
                      textUtil("Password"),
                      buildTextField(
                        hintText: "Enter your password",
                        obscureText: true,
                        iconName: MediaRes.lock,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(PasswordEvent(value));
                        },
                      ),
                      textUtil("Confirm Password"),
                      buildTextField(
                        hintText: "Enter your confirm password",
                        obscureText: true,
                        iconName: MediaRes.lock,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(RePasswordEvent(value));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 270.w,
                  margin: EdgeInsets.only(left: 25.w),
                  child: textUtil(
                    "By creating an account you have to agree with our terms and conditions",
                  ),
                ),
                buildLogInAndRegButton("Sign Up", "login", () {
                  RegisterController(context: context).handleEmailRegister();
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
