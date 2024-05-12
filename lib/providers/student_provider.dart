import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  // TODO: initialize students from storage
  final _students = const <Student>[
    Student(
      id: '0',
      fullName: 'Ayele Lemma',
      christianName: 'Kidane Mariam',
      department: 'Computer Science',
      sex: 'Male',
      batch: 2014,
      phone: '0968127581',
    ),
    Student(
      id: '1',
      fullName: 'Mussie Alemayehu',
      christianName: 'Kidane Mariam',
      department: 'Computer Science',
      sex: 'Male',
      batch: 2014,
      phone: '0968127581',
    ),
    Student(
      id: '2',
      fullName: 'Mussie Alemayehu',
      christianName: 'Kidane Mariam',
      department: 'Computer Science',
      sex: 'Male',
      batch: 2014,
      phone: '0968127581',
    ),
  ];

  // get all the students that are in the system
  List<Student> get students => [..._students];

  // add students in the system
  void addStudent(Student stud) {
    _students.add(stud);
    notifyListeners();
  }
}
