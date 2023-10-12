import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMainButton2 extends StatelessWidget {
  const CustomMainButton2(
      {super.key, required this.title, required this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: ConstColors.lightPrimaryColor),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                color: ConstColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
    );
  }
}
