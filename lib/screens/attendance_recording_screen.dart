import 'package:flutter/material.dart';

import '../widgets/attendance_recording_screen_widgets/custom_app_bar.dart';

class AttendanceRecordingScreen extends StatelessWidget {
  static const routeName = '/attendance_recording';

  const AttendanceRecordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: const Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}
