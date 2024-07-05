import 'dart:io';
import 'package:flutter/material.dart';
import 'package:glauco_care/Core/utils/api_services.dart';
import 'package:glauco_care/Features/Scan/Result/result_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button2.dart';
import 'package:mime/mime.dart';
import 'package:glauco_care/Core/Shared/widgets/result_card.dart';

class OctScanUploadView extends StatefulWidget {
  const OctScanUploadView({super.key});
  static const String routeName = "OctScanUploadView";

  @override
  _OctScanUploadViewState createState() => _OctScanUploadViewState();
}

class _OctScanUploadViewState extends State<OctScanUploadView> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  Map<String, dynamic>? _predictionResult;
  bool _isLoading = false;

  Future<void> _pickImageAndPredict() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isLoading = true;
      });

      Map<String, dynamic> result = await ApiService.predictOCT(
        context: context,
        imageFile: _selectedImage!,
      );

      setState(() {
        _predictionResult = result;
        _isLoading = false;
      });

      print(result);
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppBar(text: "OctScan Upload"),
              const SizedBox(
                height: 60,
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
                  child: _selectedImage != null
                      ? Image.file(_selectedImage!, fit: BoxFit.cover)
                      : const Center(child: Text('No image selected')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 36, bottom: 24),
                child: CustomMainButton(
                  title: "Upload",
                  onTap: _pickImageAndPredict,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomMainButton2(
                  title: "View result",
                  onTap: () {
                    if (_selectedImage != null && _predictionResult != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ResultView(
                            image: _selectedImage!,
                            predictionResult: _predictionResult!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('No prediction result available')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Visibility(
            visible: _isLoading,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
