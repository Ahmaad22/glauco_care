import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({Key? key});
  static const String routeName = "OnboardingView1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: ConstColors.darkBackgroundColor
                        .withOpacity(0.5), // Shadow color
                    offset: const Offset(0, 5), // Position of the shadow
                    blurRadius: 5, // Spread of the shadow
                    spreadRadius: 10, // Spread the shadow evenly
                  ),
                ],
              ),
              child: Image.asset("Assets/welcomePage.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 24),
              child: Text(
                'EyeGuard Companion',
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  color: ConstColors.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: Text(
                'Empower your vision and take charge of your glaucoma journey with our app, your trusted companion for better eye health.',
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  color: ConstColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomMainButton(title: "Get Started"),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    color: ConstColors.whiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Sign in',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    color: ConstColors.lightPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
