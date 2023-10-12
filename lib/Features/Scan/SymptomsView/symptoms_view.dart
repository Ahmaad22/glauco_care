import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class SymptomsView extends StatelessWidget {
  const SymptomsView({super.key});
  static const String routeName = "SymptomsView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: "Symptoms of the disease"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Symptom(text:      'Gradual Loss of Peripheral Vision is One of the hallmark symptoms of glaucoma is the gradual loss of peripheral vision. This typically starts with a small blind spot and may advance to tunnel vision.',),
                 SizedBox(
                    height: 24,
                  ),
                  Symptom(text:      'Blurred Vision: Patients with glaucoma may experience blurred or hazy vision, which can affect their ability to see fine details clearly.',),
                 SizedBox(
                    height: 24,
                  ),
                  Symptom(text:      'Halos Around Lights: Glaucoma can cause the perception of halos or rainbow-like rings around lights, particularly at night.',),
                 SizedBox(
                    height: 24,
                  ),
                  Symptom(text:      'Intense Eye Pain: In some cases of acute angle-closure glaucoma, there can be sudden and severe eye pain, often accompanied by headaches, nausea, and vomiting. This is a medical emergency.',),
                 SizedBox(
                    height: 24,
                  ),
                  Symptom(text:      'Redness and Increased Sensitivity to Light: The eye may become red, and individuals with glaucoma may experience increased sensitivity to light (photophobia).',),
                 SizedBox(
                    height: 24,
                  ),
                  Symptom(text:      'Elevated Intraocular Pressure (IOP): Increased pressure within the eye, known as intraocular pressure (IOP), is a risk factor for glaucoma. However, not all individuals with elevated IOP will develop glaucoma, and some with normal IOP can still develop the condition.',),
                 SizedBox(
                    height: 24,
                  ),
                  Symptom(text:      "Optic Nerve Damage: Ophthalmologists often detect glaucoma by assessing the optic nerve's health during eye exams. Damage to the optic nerve is a key indicator of glaucoma and can be detected even before noticeable vision changes.",),
       SizedBox(
                    height: 96,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Symptom extends StatelessWidget {
  const Symptom({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0x1ef1f1f1)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(text,
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
            color: ConstColors.lightPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
