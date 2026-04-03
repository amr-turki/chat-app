import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/register_page.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_snack_bar.dart';
import 'package:chat_app/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalKey = GlobalKey();
  String? email;
  String? password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: globalKey,
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
                      'Sign in',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
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
                  text: 'Sign in',
                  onTap: () async {
                    if (globalKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await SignUser();

                        CustomSnackBar(context, 'Success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          CustomSnackBar(
                            context,
                            'No user found for that email.',
                          );
                        } else if (e.code == 'wrong-password') {
                          CustomSnackBar(
                            context,
                            'Wrong password provided for that user.',
                          );
                        }
                      } catch (e) {
                        CustomSnackBar(context, e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'do not have account? ',
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> SignUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
