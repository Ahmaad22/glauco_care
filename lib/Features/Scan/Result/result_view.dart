import 'dart:io';
import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/widgets/result_card.dart';

class ResultView extends StatelessWidget {
  final File image;
  final Map<String, dynamic> predictionResult;

  const ResultView({
    Key? key,
    required this.image,
    required this.predictionResult,
  }) : super(key: key);

  static const String routeName = "ResultView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            text: "Result",
          ),
          const SizedBox(
            height: 40,
          ),
          predictionResult['oct_glaucoma_probability'] > 0.5
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Positive",
                        style: TextStyle(
                          color: ConstColors.lightPrimaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Negative",
                        style: TextStyle(
                          color: ConstColors.lightPrimaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0x1ef1f1f1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.file(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
