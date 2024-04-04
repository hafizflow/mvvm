import 'package:flutter/material.dart';
import 'package:mvvm/resorces/components/custom_elevated_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/services/user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Center(
          child: CustomElevatedButton(
            title: 'Log Out',
            onPressed: () {
              UserService().removeToken();
              Navigator.pushReplacementNamed(context, RoutesName.login);
            },
          ),
        ),
      ),
    );
  }
}
