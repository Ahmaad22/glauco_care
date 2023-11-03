import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Constants/icon_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_text_form_field.dart';
import 'package:glauco_care/Core/Shared/Validation/validation.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key});
  static const String routeName = "PersonalDetailsView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              text: "Personal details",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/357726268_1334399570446800_5002302892859737700_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHS5F4B2LF1r4dgfmTh0HNGXazRQKpl3uRdrNFAqmXe5LqckCumtoPFvfU0nsNpCRv5D0X4UO6zwm9LeY7BIL3-&_nc_ohc=ce4BFKd0LWEAX9-ajk_&_nc_ht=scontent.fcai19-4.fna&oh=00_AfAG3kkMKj9iIfnCvqjFVyoqxQcqtawIlDksXrUGe13ZSQ&oe=6548E45E"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Ahmed Ali',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: ConstColors.lightPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 54,
                  ),
                  CustomTextFormField(
                      obscureText: false,
                      suffixIcon: null,
                      validator: (value) {
                        return Validation.nameValidation(value);
                      },
                      isPassword: false,
                      lable: "Full name"),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                      obscureText: false,
                      suffixIcon: null,
                      validator: (value) {
                        return Validation.emailValidation(value);
                      },
                      isPassword: false,
                      lable: "Email Address"),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    suffixIcon: ConstIcons.solidEyeSlashIcon,
                    validator: (value) {
                      return Validation.passwordValidation(value);
                    },
                    obscureText: true,
                    isPassword: true,
                    lable: 'Password',
                  ),

 SizedBox(
                    height: 36,
                  ),
                  CustomMainButton(title: "Update", onTap: (){})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
