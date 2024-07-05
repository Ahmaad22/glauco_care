import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          Icon(
            Icons.search,
            color: ConstColors.lightPrimaryColor,
            size: MediaQuery.of(context).size.width * 0.35,
          ),
          Text(
            'Doctor not found',
            style: GoogleFonts.montserrat(
              color: ConstColors.lightPrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Try searching the item with a different keyword.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: ConstColors.lightPrimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
