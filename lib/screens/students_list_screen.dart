import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './template_screen.dart';
import '../widgets/custom_progress_indicator.dart';
import '../widgets/student_list_screen_widgets/student_list_item.dart';
import '../providers/student_provider.dart';

class StudentsListScreen extends StatelessWidget {
  final int batch;

  static const routeName = '/students_list';

  const StudentsListScreen(this.batch, {super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: 'የተማሪ መረጃ',
      body: Consumer<StudentProvider>(
        builder: (ctx, studentsProvider, _) {
          if (!studentsProvider.initLoaded) {
            return const CustomProgressIndicator();
          } else {
            // initialize the students in the system
            final students = studentsProvider.students(batch);

            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (ctx, index) => StudentListItem(students[index]),
            );
          }
        },
      ),
    );
  }
}
