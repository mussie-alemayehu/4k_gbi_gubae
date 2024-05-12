import 'package:flutter/material.dart';

import '../../models/student.dart';

class StudentListItem extends StatelessWidget {
  final Student student;

  const StudentListItem(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 28),
      splashColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
      onTap: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        student.fullName,
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        student.phone,
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
          fontSize: 12,
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
