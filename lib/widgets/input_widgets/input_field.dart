import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final void Function(String?) onSaved;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.title,
    required this.onSaved,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
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
}
