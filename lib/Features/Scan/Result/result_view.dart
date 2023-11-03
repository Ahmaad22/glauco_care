import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/widgets/result_card.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});
  static const String routeName = "ResultView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            text: "Result",
          ),
          SizedBox(
            height: 40,
          ),
          ResultCardView(),
        ],
      ),
    );
  }
}
