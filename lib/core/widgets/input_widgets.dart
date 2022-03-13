import 'dart:ffi';

import 'package:flutter/material.dart';

class NeumorphismInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? hint;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;

  const NeumorphismInputWidget({
    required this.controller,
    this.suffixIcon,
    this.hint,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffd2d2d2),
            Color(0xfff5f5f5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.4],
          tileMode: TileMode.clamp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      child: TextField(
        expands: false,
        focusNode: focusNode,
        controller: controller,
        style: const TextStyle(fontSize: 20.0, fontFamily: 'GothamRounded',),
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'GothamRounded'),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

}
