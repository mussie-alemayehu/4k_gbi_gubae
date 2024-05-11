import 'package:flutter/material.dart';

import './template_screen.dart';
import '../widgets/batch_selector.dart';

class AttendanceRecordingScreen extends StatefulWidget {
  static const routeName = '/attendance_recording';

  const AttendanceRecordingScreen({super.key});

  @override
  State<AttendanceRecordingScreen> createState() =>
      _AttendanceRecordingScreenState();
}

class _AttendanceRecordingScreenState extends State<AttendanceRecordingScreen> {
  // TODO: initialize the batches dynamically
  final batches = [2010, 2011, 2012, 2013, 2014, 2015, 2016];
  late int selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = batches[0];
  }

  // to update the currently selected batch
  void _updateBatch(int batch) {
    setState(() => selectedYear = batch);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      title: 'አመልካች',
      body: Column(
        children: [
          BatchSelector(
            batches: batches,
            selectedBatch: selectedYear,
            onTap: _updateBatch,
          ),
        ],
      ),
    );
  }
}
