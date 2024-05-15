import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import './template_screen.dart';
import '../providers/student_provider.dart';
import '../services/input_validators.dart' as validators;
import '../widgets/input_widgets/input_field.dart';
import '../widgets/input_widgets/custom_dropdown_menu.dart';
import '../widgets/custom_progress_indicator.dart';

class NewStudentScreen extends StatefulWidget {
  static const routeName = '/new_student';

  const NewStudentScreen({super.key});

  @override
  State<NewStudentScreen> createState() => _NewStudentScreenState();
}

class _NewStudentScreenState extends State<NewStudentScreen> {
  bool checked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> studentInfo = {};

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final studentsProvider =
        Provider.of<StudentProvider>(context, listen: false);

    const departments = [
      'Computer Science',
      'Biology',
      'Chemistry',
      'Physics',
      'Mathematics',
      'Geology',
      'Sport Science',
      'Teaching',
    ];
    const sexes = ['ወንድ', 'ሴት'];

    return TemplateScreen(
      title: 'ተማሪ ጨምር',
      body: studentsProvider.initLoaded
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'ተማሪዎችን ወደ መረጃ ቋት ለመጨመር የሚከተሉትን ይሙሉ።',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 8),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // an input field to take the full name of the student
                            InputField(
                              title: 'ሙሉ ሥም',
                              validator: validators.nameValidator,
                              onSaved: (String? value) {
                                if (value == null) return;
                                studentInfo['full_name'] = value;
                              },
                            ),
                            const SizedBox(height: 16),
                            // an input field to take the christian name of the student
                            InputField(
                                title: 'ክርስትና ሥም',
                                validator: validators.nameValidator,
                                onSaved: (String? value) {
                                  if (value == null) return;
                                  studentInfo['christian_name'] = value;
                                }),
                            const SizedBox(height: 16),
                            // an input field to take the id of the student
                            InputField(
                                title: 'መለያ (ID)',
                                validator: validators.idValidator,
                                onSaved: (String? value) {
                                  if (value == null) return;
                                  studentInfo['id'] = value;
                                }),
                            const SizedBox(height: 16),
                            // an custom dropdown menu to take the sex of the student
                            CustomDropdownMenu(
                                title: 'ፆታ',
                                hint: 'ፆታ ይምረጡ....',
                                values: sexes,
                                width: width,
                                onSelected: (String? value) {
                                  if (value == null) return;
                                  studentInfo['sex'] = value;
                                }),
                            const SizedBox(height: 16),
                            // an input field to take the phone of the student
                            InputField(
                                title: 'ስልክ',
                                validator: validators.phoneValidator,
                                onSaved: (String? value) {
                                  if (value == null) return;
                                  studentInfo['phone'] = value;
                                }),
                            const SizedBox(height: 16),
                            // an custom dropdown menu to take the department of the student
                            CustomDropdownMenu(
                                title: 'ዲፓርትመንት',
                                hint: 'ዲፓርትመንት ይምረጡ....',
                                values: departments,
                                width: width,
                                onSelected: (String? value) {
                                  if (value == null) return;
                                  studentInfo['department'] = value;
                                }),
                            const SizedBox(height: 16),
                            // an input field to take the batch of the student
                            InputField(
                                title: 'ባች',
                                validator: validators.batchValidator,
                                onSaved: (String? value) {
                                  if (value == null) return;
                                  studentInfo['batch'] = int.parse(value);
                                }),
                            const SizedBox(height: 16),
                            Text(
                              'ተቆጣጣሪ (optional)',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: checked,
                                    onChanged: (value) =>
                                        setState(() => checked = !checked),
                                    side: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    'አዎ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    final isValid =
                                        _formKey.currentState!.validate();
                                    if (isValid) {
                                      // save the form to save values to the studentInfo map
                                      _formKey.currentState!.save();

                                      // add the students to the app
                                      studentsProvider.addStudent(
                                          Student.fromMap(studentInfo));

                                      // go back to main screen
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text('ተማሪ ጨምር'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const CustomProgressIndicator(),
    );
  }
}
