import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_otp_text_form_field.dart';
import 'package:glauco_care/Features/OnBoarding/CreateNewPassword/create_new_password_view.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  static const String routeName = "VerificationView";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? otp1;
  String? otp2;
  String? otp3;
  String? otp4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: VerificationView._formKey,
          child: Column(
            children: [
              const CustomAppBar(
              ),
              const SizedBox(
                height: 45,
              ),
              Text(
                'Verifying your account',
                style: GoogleFonts.montserrat(
                  color: ConstColors.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.12,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Text(
                        'We have just sent you 4 digit code via email',
                        style: GoogleFonts.montserrat(
                          color: ConstColors.greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.12,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'example@gmail.com',
                        style: GoogleFonts.montserrat(
                          color: ConstColors.whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomOtpTextFormField(
                      onSaved: (p0) {
                        otp1 = p0;
                      },
                    ),
                    CustomOtpTextFormField(
                      onSaved: (p0) {
                        otp2 = p0;
                      },
                    ),
                    CustomOtpTextFormField(
                      onSaved: (p0) {
                        otp3 = p0;
                      },
                    ),
                    CustomOtpTextFormField(
                      onSaved: (p0) {
                        otp4 = p0;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomMainButton(
                  title: 'Continue',
                  onTap: () {
                    if (VerificationView._formKey.currentState!.validate()) {
                      VerificationView._formKey.currentState!.save();
                      Navigator.pushNamed(
                          context, CreateNewPasswordView.routeName);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Didn’t receive code?  ',
                    style: GoogleFonts.montserrat(
                      color: ConstColors.greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.12,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style: GoogleFonts.montserrat(
                        color: ConstColors.lightPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
