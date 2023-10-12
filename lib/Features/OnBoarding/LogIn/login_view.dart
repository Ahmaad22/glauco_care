import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Constants/icon_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_text_form_field.dart';
import 'package:glauco_care/Core/Shared/Functions/functions.dart';
import 'package:glauco_care/Core/Shared/Validation/validation.dart';
import 'package:glauco_care/Core/Shared/widgets/bottom_navigation_bar.dart';
import 'package:glauco_care/Features/OnBoarding/ResetPassword/reset_password_view.dart';
import 'package:glauco_care/Features/OnBoarding/SignUp/sign_up_view.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static const String routeName = "LogInView";
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? emailAddress;
  String? password;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GlobalFunctions.unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: LogInView._formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
               Image.asset("Assets/SignInTop.png",),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.montserrat(
                        color: ConstColors.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(
                      top: 32, left: 24, right: 24, bottom: 32),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, bottom: 40, right: 24),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ResetPasswordView.routeName);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.montserrat(
                                color: ConstColors.lightPrimaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24.0),
                  child: CustomMainButton(
                    title: "Login",
                    onTap: () async {
                      if (LogInView._formKey.currentState!.validate()) {
                        // try {
                        //   await FirebaseAuth.instance.signInWithEmailAndPassword(
                        //     email: emailAddress!,
                        //     password: password!,
                        //   );
                        //   // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, CustomBottomNavigationBar.routeName);
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'user-not-found') {
                        //     showSnackBar(
                        //         context, 'No user found for that email.');
                        //   } else if (e.code == 'wrong-password') {
                        //     showSnackBar(context,
                        //         'Wrong password provided for that user.');
                        //   }
                        // } catch (e) {
                        //   showSnackBar(context, 'ther was an erorr');
                        // }
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
                ,Padding(
                  padding: const EdgeInsets.only(top:24.0),
                  child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                  Text(
                    'Don’t have account ? ',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      color: ConstColors.whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, SignUpView.routeName);
                    },
                    child: Text(
                      'create account',
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
      
        
        LoginIcons()
        , 
                            
                           
         ],
            ),
          ),
        ),
bottomNavigationBar:   Image.asset("Assets/SignInBottom.png",)
,

      ),
    );
  }
}

class LoginIcons extends StatelessWidget {
  const LoginIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("Assets/Gooogle.png",width: 55,height: 55,),
           const  SizedBox(width: 32,)
      
      ,  Image.asset("Assets/Insta.png",width: 55,height: 55)
      ,const SizedBox(width: 32,)
      ,  Image.asset("Assets/Twitter.png",width: 55,height: 55)
      ],),
    );
  }
}
