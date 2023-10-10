import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Features/OnBoarding/OnBoardingView1/onboarding_view1.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key});
  static const String routeName = "SplashView";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
                      ConstColors.darkPrimaryColor,
                      ConstColors.lightPrimaryColor.withOpacity(.26)
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AnimatedSplashScreen(
          duration: 1500,
          splashIconSize: 250,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                child: Image.asset("Assets/Glaucoma.png"),
              ),
              Text(
                'GlaucoCare',
                style: GoogleFonts.montserrat(
                  color: ConstColors.blackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.12,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          nextScreen: const OnboardingView1(),
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
