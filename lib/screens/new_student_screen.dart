import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class NewStudentScreen extends StatelessWidget {
  static const routeName = '/new_student';

  const NewStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: const Column(
        children: [
          CustomAppBar('ተማሪ ጨምር'),
        ],
      ),
    );
  }
}
