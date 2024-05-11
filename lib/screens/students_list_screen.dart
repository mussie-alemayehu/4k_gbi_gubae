import 'package:flutter/material.dart';

import './template_screen.dart';

class StudentsListScreen extends StatelessWidget {
  static const routeName = '/students_list';

  const StudentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateScreen(
      title: 'የተማሪ መረጃ',
      body: Placeholder(),
    );
  }
}
