import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/widgets/hospital_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalsView extends StatelessWidget {
  const HospitalsView({super.key});
  static const String routeName = "HospitalsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              text: "Hospitals",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'nearst',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      color: ConstColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  HospitalLocationCard(),
                  HospitalLocationCard(),
                  HospitalLocationCard(),
                  HospitalLocationCard(),
                  HospitalLocationCard(),
      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
