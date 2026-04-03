import 'package:chat_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      body: Column(
        children: [
          SizedBox(height: 24),
          Image(height: 70, image: AssetImage('assets/images/icon.png')),
          SizedBox(height: 24),
          Text(
            'Chat App',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Text(
                'Sign in',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 34),
          CustomTextField(text: 'Email'),
          SizedBox(height: 24),
          CustomTextField(text: 'Password'),
        ],
      ),
    );
  }
}
