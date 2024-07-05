import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});
  static const String routeName = "FavouritesView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              text: "Favourites",
            ),
            SizedBox(
              height: 36,
            ),
            Column(
              children: [
                // DoctorCard(),
                // DoctorCard(),
                // DoctorCard(),
                // DoctorCard(),
                SizedBox(
                  height: 36,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
