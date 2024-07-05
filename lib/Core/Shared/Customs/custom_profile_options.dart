import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_on_off.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProfileOption extends StatelessWidget {
  const CustomProfileOption(
      {super.key,
      this.isLogOut = false,
      required this.icon,
      required this.title,
      this.isDarkMode = false});
  final IconData? icon;
  final String title;
  final bool isLogOut;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: ConstColors.whiteColor.withOpacity(0.05),
          radius: 20,
          child: Icon(
            icon,
            color: ConstColors.lightPrimaryColor,
            size: 24,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: ConstColors.lightPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        isLogOut
            ? Container()
            : isDarkMode
                ? CustomOnOff(color: ConstColors.lightPrimaryColor)
                : const Icon(
                    Icons.arrow_forward_ios,
                    color: ConstColors.lightPrimaryColor,
                    size: 20,
                  )
      ],
    );
  }
}
