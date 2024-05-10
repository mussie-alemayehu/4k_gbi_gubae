import 'package:flutter/material.dart';

String? nameValidator(String? value) {
  debugPrint('validating name');
  if (value == null || value.isEmpty) {
    return 'እባክዎ የተማሪውን ስም ይሙሉ።';
  }
  // TODO: if we are entering the names of the students in English characters,
  // we can use the following validator. Otherwise, it will be removed

  // if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
  //   return 'Please enter a valid name.';
  // }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'እባክዎ የተማሪውን ስልክ ይሙሉ።';
  }
  if (!RegExp(r'^(0|\+251)[0-9]{9}$').hasMatch(value)) {
    return 'ያስገቡት ስልክ ትክክል አይደለም።';
  }
  return null;
}

String? idValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'እባክዎ የተማሪውን መለያ ይሙሉ።';
  }
  // convert received value to uppercase to achieve case insensitivity
  value = value.toUpperCase();
  if (!RegExp(r'^(UGR|NSR)/[0-9]{4}/[0-9]{2}$').hasMatch(value)) {
    return 'ያስገቡት መለያ ትክክል አይደለም።';
  }
  return null;
}

String? batchValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'እባክዎ የተማሪውን ባች ይሙሉ።';
  }
  if (!RegExp(r'^2[0-9]{3}$').hasMatch(value)) {
    return 'ያስገቡት ባች ትክክል አይደለም።';
  }
  return null;
}

// this validator may be used later
// TODO: to be removed if not used

// String? passwordValidator(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter a password';
//   }
//   if (value.length < 8) {
//     return 'Password must be at least 8 characters long';
//   }
//   if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
//     return 'Must contain at least one uppercase letter';
//   }
//   if (!RegExp('(?=.*[a-z])').hasMatch(value)) {
//     return 'Must contain at least one lowercase letter';
//   }
//   if (!RegExp('(?=.*[0-9])').hasMatch(value)) {
//     return 'Must contain at least one number';
//   }
//   if (!RegExp('(?=.*[!@#\$%^&*])').hasMatch(value)) {
//     return 'Must contain at least one special character';
//   }
//   return null;
// }

// void main() {
//   const batch = '2999';

//   print(batchValidator(batch));
// }
