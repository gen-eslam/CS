
import 'package:cs/shared/cache_helper.dart';
import 'package:cs/shared/constant.dart';
import 'package:cs/shared/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'cubit/home_cubit.dart';
import 'module/home_screen.dart';
import 'module/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  await CacheHelper.init();
  uId = CacheHelper.getData('uId');
  Bloc.observer = MyBlocObserver();
  //isAdmin = CacheHelper.getData('isAdmin');
  Widget startWidget;
  if (uId != null) {
    startWidget = HomeScreen();
  } else {
    startWidget = LoginScreen();
  }
  runApp( MyApp(startWidget));
}


class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp(this.startWidget);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:
    [
      BlocProvider(create:(context)=> HomeCubit()),

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode(),
        darkTheme: darkMode(),
        themeMode: ThemeMode.light,
        home:startWidget,
      ),);
  }
}


