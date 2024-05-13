import 'package:flutter/material.dart';
import 'package:gubae_ze4k/services/db_services.dart';

import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  // TODO: initialize students from storage
  final _students = <Student>[
    const Student(
      id: '0',
      fullName: 'Ayele Lemma',
      christianName: 'Kidane Mariam',
      department: 'Computer Science',
      sex: 'Male',
      batch: 2014,
      phone: '0968127581',
    ),
    const Student(
      id: '1',
      fullName: 'Mussie Alemayehu',
      christianName: 'Kidane Mariam',
      department: 'Computer Science',
      sex: 'Male',
      batch: 2014,
      phone: '0968127581',
    ),
    const Student(
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
  void addStudent(Student stud) async {
    try {
      DBService.addStudent(stud);
      _students.add(stud);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
