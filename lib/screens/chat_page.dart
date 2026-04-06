import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/widget/chat_bubble.dart';
import 'package:chat_app/widget/chat_bubble_friend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    KMessagesCollections,
  );
  static String id = "ChatApp";
  TextEditingController _controller = TextEditingController();
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('CreatedAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagess = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagess.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }

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
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
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
                    controller: controller,
                    reverse: true,
                    itemCount: messagess.length,
                    itemBuilder: (context, index) =>
                        messagess[index].id == email
                        ? ChatBubble(message: messagess[index])
                        : ChatBubbleFriend(message: messagess[index]),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 14,
                  ),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      messages.add({
                        'message': value,
                        'CreatedAt': DateTime.now(),
                      });
                      _controller.clear();
                      controller.animateTo(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
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
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
