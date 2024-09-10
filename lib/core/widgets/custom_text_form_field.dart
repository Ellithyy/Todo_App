import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final int maxLines;
  final String? labelText;
  Widget? suffixIcon;
  bool? obscureText;

  CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText,
    required this.maxLines,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      obscureText: obscureText!,
      decoration: InputDecoration(
        suffixIconColor: theme.primaryColor,
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: theme.textTheme.bodyMedium,
        hintText: hintText,
      ),
    );
  }
}