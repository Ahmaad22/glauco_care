import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});
  static const String routeName = "ResultView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            text: "Result",
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0x1ef1f1f1)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Positive",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            color: ConstColors.lightPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "Assets/GlaucomaResult.png",
                      height: 250,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 16,),
                        Text(
                          "30-1-2023",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            color: ConstColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),                      SizedBox(height: 16,),
          
                    Text(
                      "You have been diagnosed with glaucoma. ",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.montserrat(
                        color: ConstColors.lightPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
