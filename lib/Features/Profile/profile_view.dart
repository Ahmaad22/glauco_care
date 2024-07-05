import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_profile_options.dart';
import 'package:glauco_care/Features/History/history_view.dart';
import 'package:glauco_care/Features/OnBoarding/LogIn/login_view.dart';
import 'package:glauco_care/Features/Personal%20Details/personal_details.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);
  static const String routeName = "ProfileView";

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isDarkModeEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              text: "Profile",
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
                    backgroundImage: AssetImage("Assets/chatbot_medical.png"),
                  ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, PersonalDetailsView.routeName);
                    },
                    child: const CustomProfileOption(
                      icon: Icons.account_circle_outlined,
                      title: 'Personal Details',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HistoryView.routeName);
                    },
                    child: const CustomProfileOption(
                      icon: Icons.history_outlined,
                      title: 'History',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDarkModeEnabled = !isDarkModeEnabled;
                      });
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              ConstColors.whiteColor.withOpacity(0.05),
                          radius: 20,
                          child: Icon(
                            Icons.wb_sunny,
                            color: ConstColors.lightPrimaryColor,
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Text(
                          "Theme Mode",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: ConstColors.lightPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 80, // Adjust as needed
                          height: 35, // Adjust as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? ConstColors.lightPrimaryColor
                                : Colors.grey,
                          ),
                          alignment: isDarkModeEnabled
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            width: 40, // Ball size
                            height: 40, // Ball size
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LogInView.routeName);
                    },
                    child: const CustomProfileOption(
                      icon: Icons.logout_outlined,
                      title: 'Log out',
                      isLogOut: true,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: isDarkModeEnabled
          ? ConstColors.darkBackgroundColor
          : Color.fromARGB(255, 207, 207, 207),
    );
  }
}
