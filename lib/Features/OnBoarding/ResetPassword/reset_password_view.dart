import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_text_form_field.dart';
import 'package:glauco_care/Core/Shared/Functions/functions.dart';
import 'package:glauco_care/Core/Shared/Validation/validation.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';
import 'package:glauco_care/Features/OnBoarding/Verification/verification_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/Shared/Customs/custom_app_bar.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  static const String routeName = "ResetPasswordView";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: ResetPasswordView._formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const CustomAppBar(),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  'Reset Password',
                  style: GoogleFonts.montserrat(
                    color: ConstColors.whiteColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Recover your account password',
                  style: GoogleFonts.montserrat(
                    color: ConstColors.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFormField(
                    suffixIcon: null,
                    validator: (value) {
                      return Validation.emailValidation(value);
                    },
                    onChanged: (p1) {
                      email = p1;
                    },
                    obscureText: false,
                    isPassword: false,
                    lable: 'Email Address',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomMainButton(
                    title: 'Next',
                    onTap: () async {
                      if (ResetPasswordView._formKey.currentState!.validate()) {
                        Map<String, dynamic> data =
                            await BlocProvider.of<UserCubit>(context)
                                .sendVerification(
                                    context: context, email: email);
                        BlocProvider.of<UserCubit>(context).verficationCode =
                            data["message"].toString();

                        // ignore: use_build_context_synchronously
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VerificationView(emailAddress: email);
                        }));
                      } else {
                        setState(
                          () {
                            autovalidateMode = AutovalidateMode.always;
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
