import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_book_store/core/utils/theme.dart';

import '../utils/constants.dart';

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
      decoration: ShapeDecoration(
        gradient: primaryGradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
      child: TextField(
        expands: false,
        focusNode: focusNode,
        controller: controller,
        style: Get.textTheme.bodyText1,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: Get.textTheme.bodyText1,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }

}
