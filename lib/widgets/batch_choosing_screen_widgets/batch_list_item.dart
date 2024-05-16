import 'package:flutter/material.dart';
import 'package:gubae_ze4k/screens/students_list_screen.dart';

class BatchListItem extends StatelessWidget {
  final String batch;

  const BatchListItem(this.batch, {super.key});

  @override
  Widget build(BuildContext context) {
    // decide the batch of the students required as an integer
    int intBatch = 0;
    switch (batch) {
      case '1ኛ አመት':
        intBatch = 1;
        break;
      case '2ኛ አመት':
        intBatch = 2;
        break;
      case '3ኛ አመት':
        intBatch = 3;
        break;
      case '4ኛ አመት':
        intBatch = 4;
        break;
      case '5ኛ አመት':
        intBatch = 5;
        break;
    }

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 28),
      splashColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => StudentsListScreen(intBatch),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        batch,
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: 16,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
        style: IconButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
