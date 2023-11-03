
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';

// ignore: must_be_immutable
class CustomSearchTextField extends StatelessWidget {
   CustomSearchTextField({
    super.key, this.onChanged,this.onTap,
    this.readOnly=false,
  });
final void Function(String)? onChanged;
final void Function()?  onTap;
bool readOnly = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        onTap:onTap ,
        readOnly: readOnly,
        onChanged: onChanged,
        style: GoogleFonts.montserrat(
          color: ConstColors.lightPrimaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.12,
        ),
        cursorColor: ConstColors.lightPrimaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: ConstColors.whiteColor.withOpacity(0.05),
          hintText: 'Search a doctor',
          hintStyle: GoogleFonts.montserrat(
            color: ConstColors.lightPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.12,
          ),
          prefixIcon:
              const Icon(Icons.search, color: ConstColors.lightPrimaryColor),
         
          contentPadding: const EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}