import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button2.dart';
import 'package:glauco_care/Features/Scan/ImageUpload/image_upload.dart';
import 'package:glauco_care/Features/Scan/OctScanUpload/oct_scan_upload.dart';
import 'package:glauco_care/Features/Scan/SymptomsView/symptoms_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});
  static const String routeName = "ScanView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            text: "Scan",
          ),
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Scan with:',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    color: ConstColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomMainButton(
              title: 'Oct Scan',
              onTap: () {
                Navigator.pushNamed(context, OctScanUploadView.routeName);
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          //   child: CustomMainButton2(
          //     title: 'Eye picture',
          //     onTap: () {
          //       Navigator.pushNamed(context, ImageUploadView.routeName);
          //     },
          //   ),
          // ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SymptomsView.routeName);
            },
            child: Text(
              'See Symptoms of the disease ',
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                color: ConstColors.lightPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
