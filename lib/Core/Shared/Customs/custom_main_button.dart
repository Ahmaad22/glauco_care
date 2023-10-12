import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({super.key, required this.title, required this.onTap});
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
          gradient: LinearGradient(
              colors: [
                        ConstColors.darkPrimaryColor,
                        ConstColors.lightPrimaryColor.withOpacity(.26)
                    ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight
              ,
            ),
            borderRadius: BorderRadius.circular(16)
          ),
        child: Center(
          child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                      color: ConstColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),),
        )
      ),
    );
  }
}