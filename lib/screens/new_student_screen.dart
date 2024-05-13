import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gubae_ze4k/models/student.dart';
import 'package:provider/provider.dart';

import './template_screen.dart';
import '../providers/student_provider.dart';
import '../services/input_validators.dart' as validators;

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
      body: Column(
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
                      _inputField(
                        context: context,
                        title: 'ሙሉ ሥም',
                        validator: validators.nameValidator,
                        onSaved: (String? value) {
                          if (value == null) return;
                          studentInfo['full_name'] = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      _inputField(
                          context: context,
                          title: 'ክርስትና ሥም',
                          validator: validators.nameValidator,
                          onSaved: (String? value) {
                            if (value == null) return;
                            studentInfo['christian_name'] = value;
                          }),
                      const SizedBox(height: 16),
                      _inputField(
                          context: context,
                          title: 'መለያ (ID)',
                          validator: validators.idValidator,
                          onSaved: (String? value) {
                            if (value == null) return;
                            studentInfo['id'] = value;
                          }),
                      const SizedBox(height: 16),
                      _dropdown(
                          context: context,
                          title: 'ፆታ',
                          hint: 'ፆታ ይምረጡ....',
                          values: sexes,
                          width: width,
                          onSelected: (String? value) {
                            if (value == null) return;
                            studentInfo['sex'] = value;
                          }),
                      const SizedBox(height: 16),
                      _inputField(
                          context: context,
                          title: 'ስልክ',
                          validator: validators.phoneValidator,
                          onSaved: (String? value) {
                            if (value == null) return;
                            studentInfo['phone'] = value;
                          }),
                      const SizedBox(height: 16),
                      _dropdown(
                          context: context,
                          title: 'ዲፓርትመንት',
                          hint: 'ዲፓርትመንት ይምረጡ....',
                          values: departments,
                          width: width,
                          onSelected: (String? value) {
                            if (value == null) return;
                            studentInfo['department'] = value;
                          }),
                      const SizedBox(height: 16),
                      _inputField(
                          context: context,
                          title: 'ባች',
                          validator: validators.batchValidator,
                          onSaved: (String? value) {
                            if (value == null) return;
                            studentInfo['batch'] = int.parse(value);
                          }),
                      const SizedBox(height: 16),
                      Text(
                        'ተቆጣጣሪ (optional)',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Checkbox(
                              value: checked,
                              onChanged: (value) =>
                                  setState(() => checked = !checked),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
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
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              final isValid = _formKey.currentState!.validate();
                              if (isValid) {
                                // save the form to save values to the studentInfo map
                                _formKey.currentState!.save();

                                // add the students to the app
                                Provider.of<StudentProvider>(context,
                                        listen: false)
                                    .addStudent(Student.fromMap(studentInfo));

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
      ),
    );
  }

  // this function will return a new text field with the provided arguments
  Widget _inputField({
    required BuildContext context,
    required String title,
    required void Function(String?) onSaved,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      style: TextStyle(color: Theme.of(context).primaryColor),
      validator: validator,
      decoration: InputDecoration(
        // isDense has to be true so that we can set custom padding in the
        // TextField
        label: Text(
          title,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 3,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      onSaved: onSaved,
    );
  }

  Widget _dropdown({
    required BuildContext context,
    required String title,
    required String hint,
    required List<String> values,
    required double width,
    required void Function(String?) onSelected,
  }) {
    return DropdownMenu(
      width: max(200, width * 0.7).toDouble(),
      label: Text(title),
      textStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      menuStyle: MenuStyle(
        visualDensity: VisualDensity.compact,
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.secondary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        suffixIconColor: Theme.of(context).primaryColor,
        labelStyle:
            TextStyle(color: Theme.of(context).primaryColor, fontSize: 12),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      onSelected: onSelected,
      dropdownMenuEntries: values.map<DropdownMenuEntry<String>>(
        (value) {
          return DropdownMenuEntry<String>(
            label: value,
            value: value,
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
          );
        },
      ).toList(),
    );
  }
}
