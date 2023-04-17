import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/auth/sign_in/bloc/sign_in_blocs.dart';

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
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {}
          if (!credential.user!.emailVerified) {}

          var user = credential.user;
          if (user != null) {
            if (!user.emailVerified) {
              toastInfo(msg: "You need to verify your email account");
              return;
            } else {
              // Login User
              toastInfo(msg: "congrats you are logged in");
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
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
