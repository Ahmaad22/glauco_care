import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Constants/icon_const.dart';
import 'package:glauco_care/Core/Helper/show_snack_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_text_form_field.dart';
import 'package:glauco_care/Core/Shared/Validation/validation.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PersonalDetailsView extends StatelessWidget {
  PersonalDetailsView({super.key});
  static const String routeName = "PersonalDetailsView";

  String? newEmail;
  String? newName;
  String? newPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              text: "Personal details",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage("Assets/chatbot_medical.png")),
                  const SizedBox(
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
                  const SizedBox(
                    height: 54,
                  ),
                  CustomTextFormField(
                      obscureText: false,
                      suffixIcon: null,
                      onChanged: (p0) {
                        newName = p0;
                      },
                      validator: (value) {
                        return Validation.nameValidation(value);
                      },
                      isPassword: false,
                      lable: "Full name"),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                      obscureText: false,
                      suffixIcon: null,
                      onChanged: (p0) {
                        newEmail = p0;
                      },
                      validator: (value) {
                        return Validation.emailValidation(value);
                      },
                      isPassword: false,
                      lable: "Email Address"),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    suffixIcon: ConstIcons.solidEyeSlashIcon,
                    onChanged: (p0) {
                      newPassword = p0;
                    },
                    validator: (value) {
                      return Validation.passwordValidation(value);
                    },
                    obscureText: true,
                    isPassword: true,
                    lable: 'Password',
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  CustomMainButton(
                      title: "Update",
                      onTap: () async {
                        await BlocProvider.of<UserCubit>(context)
                            .updateUserName(
                                context: context,
                                email: BlocProvider.of<UserCubit>(context)
                                    .userModel
                                    .email!,
                                name: newName!);
                        // ignore: use_build_context_synchronously
                        await BlocProvider.of<UserCubit>(context).updateEmail(
                            context: context,
                            email: BlocProvider.of<UserCubit>(context)
                                .userModel
                                .email!,
                            newEmail: newEmail!);
                        // ignore: use_build_context_synchronously
                        await BlocProvider.of<UserCubit>(context)
                            .updatePassword(
                          password: newPassword!,
                          context: context,
                          email: BlocProvider.of<UserCubit>(context)
                              .userModel
                              .email!,
                        );
                        showSnackBar(context, "updated successfully ");
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
