import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:glauco_care/Core/Models/user_model.dart';
import 'package:glauco_care/Core/Shared/widgets/doctor_card.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';

class DoctorsBuilder extends StatefulWidget {
  DoctorsBuilder({
    Key? key,
  });

  @override
  State<DoctorsBuilder> createState() => _DoctorsBuilderState();
}

class _DoctorsBuilderState extends State<DoctorsBuilder> {
  // @override
  // void initState() {
  //   loadDoctors();

  //   super.initState();
  // }

  // void loadDoctors() async {
  //   List<UserModel> doctorsData =
  //       await BlocProvider.of<UserCubit>(context).getDoctors(context: context);
  //   setState(() {
  //     doctors = doctorsData;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Wrap with SizedBox to provide constraints
      height: MediaQuery.of(context).size.height *
          0.55, // Example height constraint
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (BlocProvider.of<UserCubit>(context).doctors == null) {
              print("aasasdasd");
              return CircularProgressIndicator(); // Or any other loading indicator
            } else {
              return DoctorCard(
                userModel: BlocProvider.of<UserCubit>(context).doctors![index],
              );
            }
          },
          itemCount: BlocProvider.of<UserCubit>(context).doctors.length,
        ),
      ),
    );
  }
}
