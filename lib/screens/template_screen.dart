import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class TemplateScreen extends StatelessWidget {
  final Widget body;
  final String title;

  const TemplateScreen({
    super.key,
    required this.body,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          CustomAppBar(title),
          Expanded(child: body),
        ],
      ),
    );
  }
}
