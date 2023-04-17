import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/auth/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/pages/auth/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning_app/pages/auth/sign_in/bloc/sign_in_states.dart';
import 'package:ulearning_app/pages/auth/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/auth/sign_in/widgets/sign_in_widgets.dart';

import '../common_widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryBackground,
          appBar: buildAppBar("Log In"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                  child: textUtil("Or use your email account to login"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textUtil("Email"),
                      SizedBox(height: 5.h),
                      buildTextField(
                        hintText: "Enter your email address",
                        iconName: "user",
                        onChanged: (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      textUtil("Password"),
                      SizedBox(height: 5.h),
                      buildTextField(
                        hintText: "Enter your password",
                        obscureText: true,
                        iconName: "lock",
                        onChanged: (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        },
                      ),
                    ],
                  ),
                ),
                forgotPassword(),
                buildLogInAndRegButton("Log In", "login", () async {
                  SignInController(context: context).handleSignIn('email');
                }),
                buildLogInAndRegButton("Register", "register", () {
                  Navigator.pushNamed(context, "/register");
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
