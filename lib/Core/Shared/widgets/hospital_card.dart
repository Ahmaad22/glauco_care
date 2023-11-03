
import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalLocationCard extends StatelessWidget {
  const HospitalLocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ConstColors.whiteColor.withOpacity(.05)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "The International Eye Hospital",
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  color: ConstColors.lightPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Phone.png",
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            '   :   03381818',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              color: ConstColors.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Time.png",
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            '   :   24 hours',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              color: ConstColors.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Location.png",
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            '   :   Dokki. Egypt',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              color: ConstColors.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(16)),
                          child: Image.asset(
                            "Assets/hospital.png",
                            width: 100,
                            height: 100,
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              CustomMainButton(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.8,
                  title: "View Location",
                  onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
