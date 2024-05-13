import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './template_screen.dart';
import '../widgets/batch_selector.dart';
import '../widgets/student_list_screen_widgets/student_list_item.dart';
import '../providers/student_provider.dart';

class StudentsListScreen extends StatefulWidget {
  static const routeName = '/students_list';

  const StudentsListScreen({super.key});

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
  // TODO: initialize the batches dynamically
  final batches = [2010, 2011, 2012, 2013, 2014, 2015, 2016];

  late int selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = batches[0];
  }

  // to update the currently selected batch
  void _updateBatch(int batch) {
    setState(() => selectedYear = batch);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: 'የተማሪ መረጃ',
      body: Column(
        children: [
          BatchSelector(
            batches: batches,
            selectedBatch: selectedYear,
            onTap: _updateBatch,
          ),
          Expanded(
            child: Consumer<StudentProvider>(
              builder: (ctx, studentsProvider, _) {
                // initialize the students in the system
                final students = studentsProvider.students;

                return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (ctx, index) => StudentListItem(students[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
