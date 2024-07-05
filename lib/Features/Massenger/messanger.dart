import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Models/chat_model.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_search.dart';
import 'package:glauco_care/Core/Shared/widgets/chat_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';
import 'package:glauco_care/Features/Auth/Manager/user_state.dart';
import 'package:intl/intl.dart';

class MessangerView extends StatelessWidget {
  const MessangerView({Key? key}) : super(key: key);
  static const String routeName = "Messanger";

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>(); // Access UserCubit instance

    // Print the length of chats for debugging
    print('Number of chats: ${userCubit.chats.length}');

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(
                  text: "Messages",
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomSearchTextField(),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      250, // Adjust as needed
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: userCubit.chats.length,
                    itemBuilder: (context, index) {
                      return ChatCard(chatModel: userCubit.chats[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
