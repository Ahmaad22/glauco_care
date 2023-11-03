import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_profile_options.dart';
import 'package:glauco_care/Features/Favourites/favourites_view.dart';
import 'package:glauco_care/Features/History/history_view.dart';
import 'package:glauco_care/Features/OnBoarding/LogIn/login_view.dart';
import 'package:glauco_care/Features/Personal%20Details/personal_details.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = "ProfileView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              text: "Profile",
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, PersonalDetailsView.routeName);
                    },
                    child: CustomProfileOption(
                      icon: Icons.account_circle_outlined,
                      title: 'Personal Details',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HistoryView.routeName);
                    },
                    child: CustomProfileOption(
                      icon: Icons.history_outlined,
                      title: 'History',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FavouritesView.routeName);
                    },
                    child: CustomProfileOption(
                      icon: Icons.favorite_outline_outlined,
                      title: 'Favourites',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomProfileOption(
                    icon: Icons.wb_sunny,
                    title: 'Dark mode',
                    isDarkMode: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LogInView.routeName);
                    },
                    child: CustomProfileOption(
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
    );
  }
}