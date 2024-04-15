import 'package:flutter/material.dart';

class BatchChoiceItem extends StatelessWidget {
  final int year;
  final int selectedYear;

  const BatchChoiceItem({
    super.key,
    required this.year,
    required this.selectedYear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          '$year',
          style: TextStyle(
            color: year == selectedYear
                ? Theme.of(context).colorScheme.secondary
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
