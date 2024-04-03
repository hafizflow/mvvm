import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.loading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Text(title),
      ),
    );
  }
}
