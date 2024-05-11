import 'package:flutter/material.dart';

import './batch_choice_item.dart';

class BatchSelector extends StatelessWidget {
  final List<int> batches;
  final int selectedBatch;
  final void Function(int) onTap;

  const BatchSelector({
    super.key,
    required this.batches,
    required this.selectedBatch,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          itemCount: batches.length,
          itemBuilder: (ctx, index) => GestureDetector(
            onTap: () => onTap(batches[index]),
            child: BatchChoiceItem(
              year: batches[index],
              selectedYear: selectedBatch,
            ),
          ),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
