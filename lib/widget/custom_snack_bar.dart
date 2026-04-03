
  import 'package:flutter/material.dart';

void CustomSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message!)));
  }

