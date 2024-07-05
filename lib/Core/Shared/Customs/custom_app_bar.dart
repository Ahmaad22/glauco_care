import 'package:flutter/material.dart';
import 'package:glauco_care/Features/Profile/profile_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors_const.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.text, this.isHome = false});
  final String? text;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        text == null ? '' : text!,
        style: GoogleFonts.montserrat(
          color: ConstColors.lightPrimaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.12,
        ),
      ),
      leading: Center(
        child: isHome
            ? const Padding(
                padding: EdgeInsets.only(left: 4, top: 4),
                child: CircleAvatar(
                    backgroundColor: ConstColors.darkBackgroundColor,
                    radius: 18,
                    backgroundImage: NetworkImage(
                        "https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/357726268_1334399570446800_5002302892859737700_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHS5F4B2LF1r4dgfmTh0HNGXazRQKpl3uRdrNFAqmXe5LqckCumtoPFvfU0nsNpCRv5D0X4UO6zwm9LeY7BIL3-&_nc_ohc=ce4BFKd0LWEAX9-ajk_&_nc_ht=scontent.fcai19-4.fna&oh=00_AfAG3kkMKj9iIfnCvqjFVyoqxQcqtawIlDksXrUGe13ZSQ&oe=6548E45E")),
              )
            : Container(
                width: 36,
                height: 36,
                decoration: ShapeDecoration(
                  color: ConstColors.greyColor.withOpacity(0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: IconButton(
                    padding: const EdgeInsets.only(left: 4),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: ConstColors.lightPrimaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
      ),
      actions: [
        isHome
            ? Padding(
                padding: const EdgeInsets.only(right: 4),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ProfileView.routeName);
                    },
                    icon: Image.asset(
                      "Assets/Profile.png",
                      color: ConstColors.lightPrimaryColor,
                      width: 24,
                      height: 24,
                    )),
              )
            : Container()
      ],
    );
  }
}
