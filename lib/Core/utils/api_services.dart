import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_main_button2.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'dart:convert';

class ApiService {
  static String baseUrl = 'http://192.168.1.4:2500/';
  static Future<Map<String, dynamic>> signUp({
    required BuildContext context,
    required String name,
    required String role,
    required String email,
    required String password,
    required String city,
  }) async {
    try {
      print(email);
      Uri url = Uri.parse('${baseUrl}users/signUp');
      http.Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "name": name,
          "password": password,
          "role": role,
          "city": city
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      // Handle any errors that occur during the API call
      print("Error occurred during signUp: $error");
      return {"error": "An error occurred during sign up."};
    }
  }

  static Future<Map<String, dynamic>> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      print(email);
      Uri url = Uri.parse('${baseUrl}users/signIn');
      http.Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      // Handle any errors that occur during the API call
      print("Error occurred during signUp: $error");
      return {"error": "An error occurred during sign up."};
    }
  }

  static Future<Map<String, dynamic>> getChats({
    required BuildContext context,
    required String email,
  }) async {
    try {
      print(email);
      Uri url = Uri.parse('${baseUrl}chats/getChats');
      http.Response response = await http.get(
        url,
        headers: {
          'email':
              email, // Make sure this matches the server's expected header key
        },
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      // Handle any errors that occur during the API call
      print("Error occurred during getChats: $error");
      return {"error": "An error occurred while fetching chats."};
    }
  }

  static Future<Map<String, dynamic>> sendVerification({
    required BuildContext context,
    required String email,
  }) async {
    try {
      print(email);
      Uri url = Uri.parse('${baseUrl}users/sendVerification');
      http.Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      // Handle any errors that occur during the API call
      print("Error occurred during signUp: $error");
      return {"error": "An error occurred during sign up."};
    }
  }

  static Future<Map<String, dynamic>> predictOCT({
    required BuildContext context,
    required File imageFile,
  }) async {
    try {
      Uri url = Uri.parse(
          'http://10.0.2.2:5000/predict/oct'); // Use this for Android emulator
      // Uri url = Uri.parse('http://192.168.1.100:5000/predict/oct'); // Use this for physical devices or iOS simulator
      var request = http.MultipartRequest('POST', url);

      var mimeType = lookupMimeType(imageFile.path);
      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        contentType: MediaType.parse(mimeType!),
      );
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      print("Error occurred during predictOCT: $error");
      return {"error": "An error occurred during OCT prediction."};
    }
  }

  static Future<Map<String, dynamic>> updatePassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      print(email);
      Uri url = Uri.parse('${baseUrl}users/updatePassword');
      http.Response response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      // Handle any errors that occur during the API call
      print("Error occurred during signUp: $error");
      return {"error": "An error occurred during sign up."};
    }
  }

  static Future<Map<String, dynamic>> updateUserName(
      {required BuildContext context,
      required String email,
      required String name}) async {
    try {
      print(email);
      Uri url = Uri.parse('${baseUrl}users/updateUserName');
      http.Response response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "name": name}),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      // Handle any errors that occur during the API call
      print("Error occurred during signUp: $error");
      return {"error": "An error occurred during sign up."};
    }
  }

  static Future<List<dynamic>> getDoctors({
    required BuildContext context,
  }) async {
    try {
      Uri url = Uri.parse('${baseUrl}users/getDoctors');
      http.Response response = await http.get(
        url,
      );
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      // Handle any errors that occur during the API call
      print("Error occurred during signUp: $error");
      return [];
    }
  }

  static Future<List<dynamic>> getHospitals({
    required BuildContext context,
    required String email,
  }) async {
    print(email);
    Uri url = Uri.parse('${baseUrl}hospitals/getHospitals');
    http.Response response = await http.get(
      url,
      headers: {'Content-Type': 'application/json', 'email': email},
    );
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> updateEmail(
      {required BuildContext context,
      required String email,
      required String newEmail}) async {
    try {
      print(email);
      Uri url = Uri.parse('${baseUrl}users/updateEmail');
      http.Response response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "newEmail": newEmail}),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } catch (error) {
      // Handle any errors that occur during the API call
      print("Error occurred during signUp: $error");
      return {"error": "An error occurred during sign up."};
    }
  }
}
