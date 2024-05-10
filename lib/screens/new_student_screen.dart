import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class NewStudentScreen extends StatefulWidget {
  static const routeName = '/new_student';

  const NewStudentScreen({super.key});

  @override
  State<NewStudentScreen> createState() => _NewStudentScreenState();
}

class _NewStudentScreenState extends State<NewStudentScreen> {
  bool checked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar('ተማሪ ጨምር'),
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
                      ),
                      _inputField(
                        context: context,
                        title: 'ክርስትና ሥም',
                      ),
                      _inputField(
                        context: context,
                        title: 'መለያ (ID)',
                      ),
                      _inputField(
                        context: context,
                        title: 'ጾታ',
                      ),
                      // TODO: covert to dropdown menu
                      _inputField(
                        context: context,
                        title: 'ስልክ',
                      ),
                      // TODO: covert to dropdown menu
                      _inputField(
                        context: context,
                        title: 'ዲፓርትመንት',
                      ),
                      _inputField(
                        context: context,
                        title: 'ባች',
                      ),
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
                              _formKey.currentState!.validate();
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
    String? Function(String?)? validator,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        TextFormField(
          style: TextStyle(color: Theme.of(context).primaryColor),
          validator: validator,
          decoration: InputDecoration(
            // isDense has to be true so that we can set custom padding in the
            // TextField
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
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
