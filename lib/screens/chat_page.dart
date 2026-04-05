import 'package:chat_app/constants.dart';
import 'package:chat_app/widget/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    KMessagesCollections,
  );

  static String id = "ChatApp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: KPrimaryColor,

        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'Chat App',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(KIcon, height: 70, width: 70),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ChatBubble(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14),
            child: TextField(
              onSubmitted: (value) {
                messages.add({'message': value});
              },
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Enter your message\n',
                suffixIcon: Icon(Icons.send),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
