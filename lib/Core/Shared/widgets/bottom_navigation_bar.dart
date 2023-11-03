import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Features/Home/home_view.dart';
import 'package:glauco_care/Features/Hospitals/hospitals_view.dart';
import 'package:glauco_care/Features/Massenger/messanger.dart';
import 'package:glauco_care/Features/Scan/ScanView/scan_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  static const routeName = 'CustomBottomNavigationBar';
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    MessangerView(),
    HospitalsView(),
    ScanView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: GNav(
          color: ConstColors.lightPrimaryColor,
          activeColor: ConstColors.lightPrimaryColor,
          gap: 6,
          backgroundColor: ConstColors.darkBackgroundColor,
          tabBackgroundColor: const Color(0xFF252836),
          padding: const EdgeInsets.all(16),
          tabBorderRadius: 16,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: FontAwesomeIcons.facebookMessenger
              ,
              text: "Messanger",
            ),
            GButton(
              icon: FontAwesomeIcons.hospital,
              text: "Hospitals",
            ),
            GButton(
  icon: FontAwesomeIcons.hospital,              text: "Scan",
            )
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
