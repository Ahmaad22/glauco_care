import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Models/chat_model.dart';
import 'package:glauco_care/Core/Models/hospital_model.dart';
import 'package:glauco_care/Core/Models/user_model.dart';
import 'package:glauco_care/Core/utils/api_services.dart';
import 'package:glauco_care/Features/Auth/Manager/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  List<UserModel> doctors = [];
  List<HospitalModel> hospitals = [];
  List<ChatModel> chats = [];
  HospitalModel hospitalModel = HospitalModel();
  UserModel userModel = UserModel();
  String? verficationCode;
  signUp({required BuildContext context}) async {
    Map<String, dynamic> data = await ApiService.signUp(
        context: context,
        city: userModel.city!,
        role: userModel.role!,
        email: userModel.email!,
        name: userModel.name!,
        password: userModel.password!);
    return data;
  }

  signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    Map<String, dynamic> data = await ApiService.signIn(
        context: context, email: email, password: password);
    return data;
  }

  getHospitals({
    required BuildContext context,
    required String email,
  }) async {
    List<dynamic> data =
        await ApiService.getHospitals(context: context, email: email);
    for (var hospital in data) {
      hospitals.add(HospitalModel.fromJson(hospital));
    }
    // for (var hospital in data) {
    //   print("======${hospital}");
    // }
    return data;
  }

  getChats({
    required BuildContext context,
    required String email,
  }) async {
    Map<String, dynamic> data =
        await ApiService.getChats(context: context, email: email);
    for (var chat in data["chats"]) {
      chats.add(ChatModel.fromJson(chat));
    }
    for (var chat in data["chats"]) {
      print("======${chat["messages"]}");
    }
    return data;
  }

  void messageAdded() {
    emit(MessageAddedState());
  }

  sendVerification({
    required BuildContext context,
    required String email,
  }) async {
    Map<String, dynamic> data =
        await ApiService.sendVerification(context: context, email: email);
    return data;
  }

  getDoctors({
    required BuildContext context,
  }) async {
    List<dynamic> data = await ApiService.getDoctors(context: context);
    for (var doctor in data) {
      doctors.add(UserModel.fromJson(doctor));
    }
    for (var doctor in doctors) {
      print("======${doctor.name}");
    }
  }

  updatePassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    Map<String, dynamic> data = await ApiService.updatePassword(
        context: context, email: email, password: password);
    return data;
  }

  updateUserName(
      {required BuildContext context,
      required String email,
      required String name}) async {
    Map<String, dynamic> data = await ApiService.updateUserName(
        context: context, email: email, name: name);
    return data;
  }

  updateEmail(
      {required BuildContext context,
      required String email,
      required String newEmail}) async {
    Map<String, dynamic> data = await ApiService.updateEmail(
        context: context, email: email, newEmail: newEmail);
    return data;
  }
}
