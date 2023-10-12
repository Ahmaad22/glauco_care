import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.text,  
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        text == null ? '' : text!,
        style: GoogleFonts.montserrat(
          color: ConstColors.lightPrimaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.12,
        ),
      ),
      leading: Center(
        child: Container(
          width: 36,
          height: 36,
          decoration: ShapeDecoration(
            color: ConstColors.greyColor.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Center(
            child: IconButton(
              padding: const EdgeInsets.only(left: 4),
              icon:  Icon(Icons.arrow_back_ios,size: 20,color: ConstColors.lightPrimaryColor,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      
    );
  }
}