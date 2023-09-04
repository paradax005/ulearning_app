import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/res/colors.dart';
import 'common/routes/pages.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: AppColors.primaryText,
                ),
              ),
            ),
            onGenerateRoute: AppPages.generateRouteSettings,
          );
        },
      ),
    );
  }
}
