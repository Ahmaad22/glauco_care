import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Routes/routes.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';
import 'package:glauco_care/Features/OnBoarding/Splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        theme:
            ThemeData(scaffoldBackgroundColor: ConstColors.darkBackgroundColor),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashView.routeName,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
