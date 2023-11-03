import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({super.key, required this.title, required this.onTap,this.width=double.infinity,this.height=50});
final String title;
final double width;
final double height;

final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
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