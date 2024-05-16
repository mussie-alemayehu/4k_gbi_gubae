import 'dart:math';

import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  final String title;
  final List<String> values;
  final double width;
  final void Function(String?) onSelected;

  const CustomDropdownMenu({
    super.key,
    required this.title,
    required this.values,
    required this.width,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
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
