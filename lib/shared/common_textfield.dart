import 'package:flutter/material.dart';
import 'package:onboarding/utils/utils.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField(
      {super.key,
      required this.hintText,
      this.isPassword = false,
      required this.controller});
  final String hintText;
  bool isPassword;
  final TextEditingController controller;

  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.bodyMedium.copyWith(),
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        alignLabelWithHint: true,
        fillColor: context.isDarkMode ? Colors.black : Colors.grey.shade300,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: context.isDarkMode
              ? const BorderSide(color: Colors.grey, width: 0.5)
              : BorderSide.none,
        ),
        constraints: const BoxConstraints(
          minHeight: 55,
          maxHeight: 55,
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                },
                icon: Icon(Icons.visibility_off))
            : null,
      ),
    );
  }
}
