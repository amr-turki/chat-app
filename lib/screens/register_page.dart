import 'package:chat_app/constants.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static String id = 'RegisterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Spacer(flex: 2),
            Image(
              height: 80,
              width: 120,
              image: AssetImage('assets/images/icon.png'),
            ),
            SizedBox(height: 14),
            Text(
              'Chat App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 1),
            Row(
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomTextField(text: 'Email'),
            SizedBox(height: 24),
            CustomTextField(text: 'Password'),
            SizedBox(height: 24),

            CustomButton(text: 'Sign up'),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('do you have account? ', style: TextStyle(fontSize: 18)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
