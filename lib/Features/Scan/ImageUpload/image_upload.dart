import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button2.dart';
import 'package:glauco_care/Features/Scan/Result/result_view.dart';

class ImageUploadView extends StatelessWidget {
  const ImageUploadView({super.key});
  static const String routeName = "ImageUploadView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(text: "Image Upload"),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0x1ef1f1f1))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 36,bottom: 24),
            child: CustomMainButton(title: "Upload", onTap: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomMainButton2(title: "View result", onTap: () {
              Navigator.pushNamed(context, ResultView.routeName);
              
            }),
          ),
        ],
      ),
    );
  }
}
