
import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/widgets/doctor_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'All Doctors',
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
              color: ConstColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        DoctorCard(),
        DoctorCard(),
        DoctorCard(),
        DoctorCard(),
        DoctorCard(),
        DoctorCard(),
      ],
    );
  }
}
