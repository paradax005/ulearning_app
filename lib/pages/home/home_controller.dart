import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/global.dart';

class HomeController {
  HomeController({required this.context});
  final BuildContext context;
  UserItem? userProfile = Global.storageService.getUserProfile();

  void init() {}
}
