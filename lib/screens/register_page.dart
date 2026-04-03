import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/register_page.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_snack_bar.dart';
import 'package:chat_app/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String id = 'LoginPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> globalKey = GlobalKey();
  String? email;
  String? password;
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
                  'Sign up',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomTextField(
              text: 'Email',
              onChange: (value) {
                email = value;
              },
            ),
            SizedBox(height: 24),
            CustomTextField(
              text: 'Password',
              onChange: (value) {
                password = value;
              },
            ),
            SizedBox(height: 24),

            CustomButton(
              text: 'Sign up',
              onTap: () async {
                try {
                  await RegisterUser();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    CustomSnackBar(
                      context,
                      'The password provided is too weak.',
                    );
                    print('');
                  } else if (e.code == 'email-already-in-use') {
                    CustomSnackBar(
                      context,
                      'The account already exists for that email.',
                    );
                  }
                } catch (e) {
                  CustomSnackBar(context, e.toString());
                }
              },
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('do not have account? ', style: TextStyle(fontSize: 18)),
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

  Future<void> RegisterUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
