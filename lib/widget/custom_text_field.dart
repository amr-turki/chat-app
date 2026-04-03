import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
