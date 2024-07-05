import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Models/user_model.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ConstColors.whiteColor.withOpacity(0.05)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("Assets/doctor.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.39,
                        child: Row(
                          children: [
                            Text(
                              userModel.name!,
                              style: GoogleFonts.montserrat(
                                color: ConstColors.lightPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          children: [
                            Text(
                              userModel.description ??
                                  "Dr. Robert Hughes, a leading glaucoma specialist, safeguards vision with expertise and compassion.",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                color: ConstColors.whiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomMainButton(
                              title: "Chat",
                              onTap: () {},
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
