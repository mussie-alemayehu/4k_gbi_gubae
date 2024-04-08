import 'package:flutter/material.dart';

import '../widgets/auth_screen_widgets/custom_app_bar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: const Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}
