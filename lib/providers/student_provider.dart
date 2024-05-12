import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  final _students = <Student>[];

  // get all the students that are in the system
  List<Student> get students => [..._students];

  // add students in the system
  void addStudent(Student stud) {
    _students.add(stud);
    notifyListeners();
  }
}
