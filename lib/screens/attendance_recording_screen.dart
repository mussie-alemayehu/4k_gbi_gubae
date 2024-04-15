import 'package:flutter/material.dart';

import '../widgets/attendance_recording_screen_widgets/custom_app_bar.dart';
import '../widgets/attendance_recording_screen_widgets/batch_choice_item.dart';

class AttendanceRecordingScreen extends StatefulWidget {
  static const routeName = '/attendance_recording';

  const AttendanceRecordingScreen({super.key});

  @override
  State<AttendanceRecordingScreen> createState() =>
      _AttendanceRecordingScreenState();
}

class _AttendanceRecordingScreenState extends State<AttendanceRecordingScreen> {
  final batches = [2010, 2011, 2012, 2013, 2014, 2015, 2016];
  late int selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = batches[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                itemCount: batches.length,
                itemBuilder: (ctx, index) => GestureDetector(
                  child: BatchChoiceItem(
                    year: batches[index],
                    selectedYear: selectedYear,
                  ),
                  onTap: () {
                    setState(() => selectedYear = batches[index]);
                  },
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
