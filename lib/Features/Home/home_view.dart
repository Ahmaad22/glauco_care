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
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const CustomAppBar(
            text: "Home",
            isHome: true,
          ),
          Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomSearchTextField(),
              const SizedBox(
                height: 36,
              ),
              const HomeBodyView(),
              // EmptySearch()
            ],
          )
        ],
      ),
    );
  }
}
