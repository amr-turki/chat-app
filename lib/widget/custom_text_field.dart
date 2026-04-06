import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.text,
    required this.onChange,
    this.obscureText = false,
  });

  String text;
  void Function(String)? onChange;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChange,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
      },
      cursorColor: Colors.black,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: text,
        labelText: 'Write your $text',
        border: BorderBuilder(),
        enabledBorder: BorderBuilder(),
        focusedBorder: BorderBuilder(),
      ),
    );
  }
}

OutlineInputBorder BorderBuilder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Colors.white),
  );
}
