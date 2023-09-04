import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app/common/apis/user_api.dart';
import 'package:ulearning_app/common/constants/constant.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/auth/sign_in/bloc/sign_in_blocs.dart';

import '../../../common/routes/routes.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBloc>().state;
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }

        try {
          EasyLoading.show(
            indicator: const CircularProgressIndicator(),
            maskType: EasyLoadingMaskType.clear,
            dismissOnTap: true,
          );
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
          if (credential.user == null) {}
          if (!credential.user!.emailVerified) {}

          var user = credential.user;
          if (user != null) {
            if (!user.emailVerified) {
              toastInfo(msg: "You need to verify your email account");
              EasyLoading.dismiss();
              return;
            } else {
              LoginRequestEntity loginRequestEntity = LoginRequestEntity();
              loginRequestEntity.open_id = user.uid;
              loginRequestEntity.email = user.email;
              loginRequestEntity.type = 1;
              loginRequestEntity.name = user.displayName;
              loginRequestEntity.avatar = user.photoURL;
              await asyncPostAllData(loginRequestEntity);
            }
          } else {
            toastInfo(msg: "No user found for this email");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            toastInfo(msg: 'your email format is wrong');
          } else if (e.code == 'user-not-found') {
            toastInfo(msg: 'user email does not exist');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'user password is wrong');
          }
          EasyLoading.dismiss();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    UserLoginResponseEntity result = await UserAPI.login(data: loginRequestEntity);

    if (result.code == 200) {
      try {
        Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.popAndPushNamed(context, AppRoutes.APPLICATION);
        }
      } catch (e) {
        print('Saving on localStorage issue : ${e.toString()}');
      }
    }
  }
}
