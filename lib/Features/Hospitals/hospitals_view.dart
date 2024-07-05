import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/widgets/hospital_card.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalsView extends StatelessWidget {
  const HospitalsView({Key? key});
  static const String routeName = "HospitalsView";
  @override
  Widget build(BuildContext context) {
    // Example list of hospitals

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              text: "Hospitals",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'nearest',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      color: ConstColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        BlocProvider.of<UserCubit>(context).hospitals.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Example hospital card with a name from the list
                      return HospitalLocationCard(
                        hospitalModel: BlocProvider.of<UserCubit>(context)
                            .hospitals[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
