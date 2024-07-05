import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Constants/icon_const.dart';
import 'package:glauco_care/Core/Helper/show_snack_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_text_form_field.dart';
import 'package:glauco_care/Core/Shared/Functions/functions.dart';
import 'package:glauco_care/Core/Shared/Validation/validation.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';
import 'package:glauco_care/Features/OnBoarding/LogIn/login_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const String routeName = "SignUpView";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

enum Role { doctor, patient }

String? role = "patient"; // Default value

class _SignUpViewState extends State<SignUpView> {
  String? emailAddress;
  String? password;
  String? name;
  String? city = "Cairo"; // Variable to store the selected city

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: SignUpView._formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  Image.asset(
                    "Assets/SignInTop.png",
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8, bottom: 8),
                  //   child: Text(
                  //     "Let’s get started",
                  //     style: GoogleFonts.montserrat(
                  //         color: ConstColors.whiteColor,
                  //         fontSize: 24,
                  //         fontWeight: FontWeight.w600),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 24, right: 24, bottom: 8),
                    child: CustomTextFormField(
                      suffixIcon: null,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return 'Field is requierd';
                        }
                      },
                      onChanged: (p0) {
                        name = p0;
                      },
                      obscureText: false,
                      isPassword: false,
                      lable: 'Full name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 24, right: 24, bottom: 8),
                    child: CustomTextFormField(
                      onChanged: (value) {
                        emailAddress = value;
                      },
                      suffixIcon: null,
                      validator: (value) {
                        return Validation.emailValidation(value);
                      },
                      obscureText: false,
                      isPassword: false,
                      lable: 'Email Address',
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: CustomTextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      suffixIcon: ConstIcons.solidEyeSlashIcon,
                      validator: (value) {
                        return Validation.passwordValidation(value);
                      },
                      obscureText: true,
                      isPassword: true,
                      lable: 'Password',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 24, right: 24, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ConstColors.whiteColor),
                        ),
                        DropdownButton<String>(
                          dropdownColor: ConstColors.darkPrimaryColor,
                          iconEnabledColor: ConstColors.lightPrimaryColor,
                          isExpanded: true,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          iconSize: 24,
                          value: city,
                          menuMaxHeight:
                              MediaQuery.of(context).size.height * 0.75,
                          onChanged: (String? newValue) {
                            setState(() {
                              city = newValue;
                            });
                          },
                          items: <String>[
                            'Cairo',
                            'Giza',
                            'Alexandria',
                            'Gharbia',
                            'Luxor',
                            'The Red Sea',
                            'Minya',
                            'Beheira',
                            'Suez',
                            'South of Sinaa',
                            'Sohag',
                            'Qena',
                            'Qalyubia',
                            'Port Said',
                            'North Sinai',
                            'Marsa Matrouh',
                            'Menoufia',
                            'Kafr El-Sheikh',
                            'Ismailia',
                            'Al-Sharqia',
                            'Dakahlia',
                            'Damietta',
                            'Fayoum',
                            'Bani Sweif',
                            'Asyut',
                            'Aswan',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style:
                                      TextStyle(color: ConstColors.whiteColor)),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 24, right: 24, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Doctor',
                                style:
                                    TextStyle(color: ConstColors.whiteColor)),
                            Radio<String>(
                              autofocus: true,
                              activeColor: ConstColors.lightPrimaryColor,
                              value: "doctor",
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value;
                                });
                              },
                            ),
                            Text('Patient',
                                style:
                                    TextStyle(color: ConstColors.whiteColor)),
                            Radio<String>(
                              activeColor: ConstColors.lightPrimaryColor,
                              value: "patient",
                              groupValue: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomMainButton(
                        title: "Sign Up",
                        onTap: () async {
                          if (SignUpView._formKey.currentState!.validate()) {
                            BlocProvider.of<UserCubit>(context).userModel.name =
                                name;
                            BlocProvider.of<UserCubit>(context)
                                .userModel
                                .email = emailAddress;
                            BlocProvider.of<UserCubit>(context)
                                .userModel
                                .password = password;
                            BlocProvider.of<UserCubit>(context).userModel.role =
                                role;
                            BlocProvider.of<UserCubit>(context).userModel.city =
                                city;
                            Map<String, dynamic> data =
                                await BlocProvider.of<UserCubit>(context)
                                    .signUp(
                              context: context,
                            );

                            if (data['message'] == 'Registration successful') {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, LogInView.routeName);
                            } else {
                              // ignore: use_build_context_synchronously
                              showSnackBar(context, "email is already exist");
                            }
                          } else {
                            setState(
                              () {
                                autovalidateMode = AutovalidateMode.always;
                              },
                            );
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account ? ',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            color: ConstColors.whiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LogInView.routeName);
                          },
                          child: Text(
                            'Login',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              color: ConstColors.lightPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Image.asset(
            "Assets/SignInBottom.png",
          )),
    );
  }
}
