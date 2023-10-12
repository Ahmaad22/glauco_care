import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/welcome_choices.dart';
import 'package:glauco_care/Features/OnBoarding/LogIn/login_view.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingView3 extends StatelessWidget {
  const OnboardingView3({super.key});
  static const String routeName = "OnboardingView3";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            text: "Get Started",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Are you male or female?',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    color: ConstColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const GenderWidget(choice1: "Patient",choice2: "Doctor"),
                const SizedBox(
                  height: 100,
                ),
                CustomMainButton(
                    title: "Continue",
                    onTap: () {
                      Navigator.pushNamed(context, LogInView.routeName);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
