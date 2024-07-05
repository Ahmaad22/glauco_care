import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Models/hospital_model.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalLocationCard extends StatelessWidget {
  const HospitalLocationCard({
    super.key,
    required this.hospitalModel,
  });
  final HospitalModel hospitalModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ConstColors.whiteColor.withOpacity(.05)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hospitalModel.name!,
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  color: ConstColors.lightPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Phone.png",
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            '   :  ${hospitalModel.phone}',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              color: ConstColors.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Time.png",
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            '   :   ${hospitalModel.time}',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              color: ConstColors.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "Assets/Location.png",
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              '   :  ' +
                                  '${hospitalModel.district}, ${hospitalModel.city}',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                color: ConstColors.whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: Image.network(
                            hospitalModel.image!,
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomMainButton(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                title: "View Location",
                onTap: () {
                  // Show a message when the button is tapped
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: ConstColors.darkPrimaryColor,
                        title: Text("Address",
                            style: TextStyle(color: ConstColors.whiteColor)),
                        content: Text(hospitalModel.address!,
                            style: TextStyle(color: ConstColors.whiteColor)),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(color: ConstColors.whiteColor),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
