import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_search.dart';
import 'package:glauco_care/Core/Shared/widgets/home_body_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "HomeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              text: "Home",
              isHome: true,
            ),
            Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                CustomSearchTextField(),
                SizedBox(
                  height: 36,
                ),
                HomeBodyView(),
                // EmptySearch()
              ],
            )
          ],
        ),
      ),
    );
  }
}
