import 'package:flutter/material.dart';

import '../models/choices.dart';
import './template_screen.dart';
import '../widgets/batch_choosing_screen_widgets/batch_list_item.dart';

class BatchChoosingScreen extends StatelessWidget {
  static const routeName = '/batch_choosing';

  const BatchChoosingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: 'ባች ይምረጡ',
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: Choices.batches.length,
        itemBuilder: (ctx, index) => BatchListItem(Choices.batches[index]),
      ),
    );
  }
}
