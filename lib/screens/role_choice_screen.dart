import 'package:flutter/material.dart';
import 'package:gubae_ze4k/screens/attendance_recording_screen.dart';

import '../widgets/auth_screen_widgets/custom_app_bar.dart';

class RoleChoiceScreen extends StatelessWidget {
  static const routeName = '/role_choice';

  const RoleChoiceScreen({super.key});

  // a function that returns a custom elevated button with the given arguments
  ElevatedButton _customElevatedButton(
    BuildContext ctx, {
    required String name,
    required Function() action,
  }) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(ctx).primaryColor,
        foregroundColor: Theme.of(ctx).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Container(
        width: MediaQuery.of(ctx).size.width / 4,
        padding: const EdgeInsets.all(4),
        child: Text(
          name,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomAppBar(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(
                    '፬ ኪሎ ግቢ ጉባኤ',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 24,
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('የተማሪዎች መገኘት'),
                        Text('መቆጣጠሪያ መተግበሪያ'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  _customElevatedButton(
                    context,
                    name: 'አመልካች',
                    action: () => Navigator.of(context).pushNamed(
                      AttendanceRecordingScreen.routeName,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _customElevatedButton(
                    context,
                    name: 'ሪፖርት',
                    action: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
