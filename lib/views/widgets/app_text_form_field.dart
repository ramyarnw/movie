import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.iconColor,
    this.obscure = false,
    this.forceErrorText,
    this.validator,
    this.controller,
    this.onChanged,
    this.labelText,
    this.initialValue,
    this.decoration,
    this.enabled,
  });

  final String? hintText;
  final Color? iconColor;
  final bool obscure;
  final String? forceErrorText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? labelText;
  final String? initialValue;
  final dynamic decoration;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      forceErrorText: forceErrorText,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        fillColor: Colors.pink,
        prefix: Icon(
          Icons.add,
          color: iconColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
