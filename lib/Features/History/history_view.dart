import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});
  static const String routeName = "HistoryView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            text: "History",
          ),
          SizedBox(
            height: 40,
          ),
          //ResultCardView()
          NoHistory(),
        ],
      ),
    );
  }
}

class NoHistory extends StatelessWidget {
  const NoHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.25),
          child: Image.asset(
            "Assets/NoHistory.png",
            width: double.infinity,
            height: 170,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
      ],
    );
  }
}
