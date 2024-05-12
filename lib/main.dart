import 'package:flutter/material.dart';
import 'package:gubae_ze4k/providers/student_provider.dart';
import 'package:provider/provider.dart';

import './screens/role_choice_screen.dart';
import './screens/attendance_recording_screen.dart';
import './screens/new_student_screen.dart';
import './screens/students_list_screen.dart';

import './screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StudentProvider(),
      child: MaterialApp(
        title: '4 ኪሎ ግቢ ጉባኤ',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFCDCC80),
            onPrimary: Color(0xFF333333),
            secondary: Color(0xFF03291F),
            tertiary: Color(0xFF939139),
          ),
          useMaterial3: true,
        ),
        home: const AuthScreen(),
        routes: {
          RoleChoiceScreen.routeName: (_) => const RoleChoiceScreen(),
          AttendanceRecordingScreen.routeName: (_) =>
              const AttendanceRecordingScreen(),
          NewStudentScreen.routeName: (_) => const NewStudentScreen(),
          StudentsListScreen.routeName: (_) => const StudentsListScreen(),
        },
      ),
    );
  }
}
