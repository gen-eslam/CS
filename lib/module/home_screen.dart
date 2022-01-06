import 'package:cs/cubit/home_cubit.dart';
import 'package:cs/cubit/state.dart';
import 'package:cs/module/create_new_crourse.dart';
import 'package:cs/module/create_new_hardware.dart';
import 'package:cs/shared/cache_helper.dart';
import 'package:cs/shared/component.dart';
import 'package:cs/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, app>(
      listener: (context, state) => {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          drawer: SafeArea(
            child: Drawer(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                        ),
                    ),
                    child: const Center(
                      child: Text(
                        'CS student guide',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (isAdmin!)
                    Container(
                      width: double.infinity,
                      height: 60,
                      child: defaultTextButton(
                          text: 'Create Courses',
                          isUpper: true,
                          onPressed: () {
                            navigateTo(context, CreateCourses());
                          }),
                    ),
                  if (isAdmin!)
                    Container(
                      width: double.infinity,
                      height: 60,
                      child: defaultTextButton(
                          text: 'Create Hardware',
                          isUpper: true,
                          onPressed: () {
                            navigateTo(context, CreateHardware());
                          }),
                    ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: defaultTextButton(
                        text: 'sign out',
                        isUpper: true,
                        color: Colors.red,
                        onPressed: () {
                          CacheHelper.removeData('uId');
                           navigateAndKill(context, LoginScreen());
                        }),
                  ),

                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              cubit.appBarTitle[cubit.currentIndex],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomNavBar,
            onTap: (int index) {
              cubit.onTapNavBar(index);
            },
          ),
        );
      },
    );
  }
}
