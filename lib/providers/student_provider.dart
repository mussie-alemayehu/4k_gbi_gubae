import 'package:flutter/material.dart';
import 'package:gubae_ze4k/services/db_services.dart';

import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  final _students = <Student>[];

  // a variable that will be used to check whether the initialization is complte or not
  bool initLoaded = false;

  // get all the students that are in the system
  List<Student> get students => [..._students];

  // to initialize the app with data from internal storage
  // TODO: implement fetching from the cloud store once the store is connected
  void initializeData() async {
    // run the following snippet only if initial data is not loaded
    if (!initLoaded) {
      // get the data from the storage
      final rawData = await DBService.getData();

      // add all students obtained to the _students list
      rawData.map((stud) => _students.add(Student.fromMap(stud))).toList();

      initLoaded = true;

      notifyListeners();
    }
  }

  // add students in the system
  void addStudent(Student stud) async {
    DBService.addStudent(stud);
    _students.add(stud);
    notifyListeners();
  }
}
