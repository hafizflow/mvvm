import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/resorces/components/custom_elevated_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/view_model/services/user_service.dart';
import 'package:provider/provider.dart';

import '../resorces/components/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  ValueNotifier<bool> obscure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _emailController,
              hintText: "Email",
              label: "Email",
              prefixIcon: Icons.email_outlined,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              builder: (context, value, _) {
                return CustomTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  label: "Password",
                  prefixIcon: Icons.lock_outlined,
                  suffixIcon: value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  textInputAction: TextInputAction.next,
                  obscureText: value,
                  onSuffixIconTap: () {
                    obscure.value = !obscure.value;
                  },
                );
              },
              valueListenable: obscure,
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              title: 'Login',
              loading: authViewModel.loading,
              onPressed: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBar('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBar('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBar(
                      'Password must be more then 6 character', context);
                } else {
                  Map data = {
                    'email': _emailController.text.trim(),
                    'password': _passwordController.text,
                  };
                  authViewModel.loginApi(data, context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
