import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/constants/constant.dart';
import 'package:ulearning_app/common/res/colors.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void logout() {
    Navigator.of(context).pop();
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                logoutButton(context: context, onPressed: logout),
              ],
            ),
          );
        },
      ),
    );
  }
}
