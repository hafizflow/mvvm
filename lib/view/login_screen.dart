import 'package:flutter/material.dart';
import 'package:mvvm/resorces/components/custom_elevated_button.dart';

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
              controller: _passwordController,
              hintText: "Email",
              label: "Email",
              prefixIcon: Icons.email_outlined,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              builder: (context, value, _) {
                return CustomTextField(
                  controller: _emailController,
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
              loading: false,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
