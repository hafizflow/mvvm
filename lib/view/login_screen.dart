import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('HomePage'),
          onPressed: () {
            // Navigator.pushNamed(context, RoutesName.home);
            // Utils.toastMessage('No Internet Connection');
            // Utils.snackBar('No internet connection', context);
            // Utils.flushBar('No internet connection', context);
          },
        ),
      ),
    );
  }
}
