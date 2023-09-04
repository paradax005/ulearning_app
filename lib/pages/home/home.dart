import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/res/colors.dart';
import 'package:ulearning_app/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_state.dart';
import 'package:ulearning_app/pages/home/home_controller.dart';
import 'package:ulearning_app/pages/home/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return _homeController.userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(_homeController.userProfile!.avatar!),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            homePageText('Hello', color: AppColors.primaryThirdElementText),
                            homePageText(_homeController.userProfile!.name!, top: 5),
                          ],
                        ),
                      ),
                      SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                      SliverToBoxAdapter(
                        child: searchView(),
                      ),
                      SliverToBoxAdapter(
                        child: slidersView(context, state),
                      ),
                      SliverToBoxAdapter(
                        child: menuView(),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                      ),
                      SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.6,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          childCount: 6,
                          (context, index) {
                            return GestureDetector(
                              onTap: () {
                                debugPrint('Tapped item $index');
                              },
                              child: silverGrid(),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ))
        : const SizedBox.shrink();
  }
}
