import 'package:flutter/material.dart';

class CommonWidget
{

  myTextField(controller, hintText) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }

}
