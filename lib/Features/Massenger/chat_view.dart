import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glauco_care/Core/Constants/colors_const.dart';
import 'package:glauco_care/Core/Models/chat_model.dart';
import 'package:glauco_care/Core/Shared/Customs/custom_app_bar.dart';
import 'package:glauco_care/Core/Shared/widgets/recieved_message.dart';
import 'package:glauco_care/Core/Shared/widgets/sent_message.dart';
import 'package:glauco_care/Features/Auth/Manager/user_cubit.dart';
import 'package:glauco_care/Features/Auth/Manager/user_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatView extends StatefulWidget {
  const ChatView({Key? key, required this.chatModel}) : super(key: key);
  static const String routeName = "ChatView";
  final ChatModel chatModel;
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  late IO.Socket _socket;

  @override
  void initState() {
    super.initState();
    _initializeSocket();
  }

  void _initializeSocket() {
    _socket = IO.io('http://192.168.1.4:2500', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socket.connect();
    _socket.on('newMessage', (message) {
      print('New message received: $message');
      // Handle the new message received logic here
    });
    _socket.on('connect', (_) {
      print('Connected to server');
    });

    _socket.on('newMessage', (data) {
      for (ChatModel chat in BlocProvider.of<UserCubit>(context).chats) {
        if (chat.id == widget.chatModel.id) {
          widget.chatModel.messages!.add(MessageModel.fromJson(data));
          chat.messages = widget.chatModel.messages;
          BlocProvider.of<UserCubit>(context).messageAdded();
          setState(() {});
        }
      }
    });

    _socket.on('disconnect', (_) {
      print('Disconnected from server');
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _socket.emit('sendMessage', {
        'chatName': widget.chatModel.name, // Replace with your actual chat name
        'userEmail': BlocProvider.of<UserCubit>(context)
            .userModel
            .email, // Replace with your actual user email
        'content': _controller.text,
      });
      print('Message sent: ${_controller.text}');
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _socket.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(text: widget.chatModel.name),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.chatModel.messages!.length,
                  itemBuilder: (context, index) {
                    final message = widget.chatModel.messages![index];

                    print(message);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisAlignment: message.sender ==
                                BlocProvider.of<UserCubit>(context)
                                    .userModel
                                    .email
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          message.sender ==
                                  BlocProvider.of<UserCubit>(context)
                                      .userModel
                                      .email
                              ? SentMessage(message: message.content!)
                              : RecievedMessage(message: message.content!),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(color: ConstColors.lightPrimaryColor),
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: _sendMessage,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: ConstColors.lightPrimaryColor,
                                  size: 28,
                                ),
                                SizedBox(width: 12),
                                Icon(
                                  Icons.send,
                                  color: ConstColors.lightPrimaryColor,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                          prefixIcon: Icon(
                            FontAwesomeIcons.smile,
                            color: ConstColors.lightPrimaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Write here your message',
                          hintStyle: TextStyle(
                            color: ConstColors.lightPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
