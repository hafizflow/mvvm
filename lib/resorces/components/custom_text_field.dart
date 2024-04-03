import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextInputAction textInputAction;
  final VoidCallback? onSuffixIconTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    required this.textInputAction,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: InkWell(
            onTap: onSuffixIconTap,
            child: Icon(suffixIcon),
          ),
          hintText: hintText,
          label: Text(label),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
