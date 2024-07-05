import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Models/chat_model.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';
import 'package:glauco_care/Features/Auth/Manager/user_state.dart';
import 'package:glauco_care/Features/Massenger/chat_view.dart';
import 'package:intl/intl.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatView(chatModel: chatModel);
              }));
            },
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ConstColors.whiteColor.withOpacity(0.05),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                      ),
                      child: Image.asset("Assets/doctor.png"),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatModel.name!,
                          style: TextStyle(
                            color: ConstColors.lightPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          chatModel.messages != null &&
                                  chatModel.messages!.isNotEmpty
                              ? chatModel
                                  .messages![chatModel.messages!.length - 1]
                                  .content!
                              : "",
                          style: TextStyle(
                            color: ConstColors.lightPrimaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Spacer(),
                        Text(
                          chatModel.messages != null &&
                                  chatModel.messages!.isNotEmpty
                              ? formatDate(chatModel
                                  .messages![chatModel.messages!.length - 1]
                                  .createdAt
                                  .toString())
                              : "",
                          style: TextStyle(
                            color: ConstColors.lightPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String formatDate(String date) {
    if (date.length >= 10) {
      return date.substring(0, 10);
    } else {
      return date; // Handle the case where the string is shorter than 11 characters
    }
  }
}
