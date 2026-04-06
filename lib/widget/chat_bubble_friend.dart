import 'package:chat_app/model/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({super.key, required this.message});

  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 170,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
