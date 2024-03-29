import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app/common/constants/constant.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/auth/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (username.isEmpty) {
      toastInfo(msg: "Username can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "password can not be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }
    try {
      EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true,
      );
      final credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      EasyLoading.dismiss();
      if (credentials.user != null) {
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(username);
        String photoUrl = AppConstants.defaultAvatar;
        await credentials.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate it please check your email box and click on the link");

        if (context.mounted) {
          Navigator.of(context).pop();
        }
      }
    } on FirebaseAuthException catch (e) {
      toastInfo(msg: e.message!);
    }
  }
}
