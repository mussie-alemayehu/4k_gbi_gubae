import 'package:flutter/material.dart';

import '../widgets/auth_screen_widgets/custom_app_bar.dart';
import './attendance_recording_screen.dart';
import './new_student_screen.dart';

class RoleChoiceScreen extends StatelessWidget {
  static const routeName = '/role_choice';

  const RoleChoiceScreen({super.key});

  // a function that returns a custom button with the given arguments
  Widget _customButton(
    BuildContext ctx, {
    required String name,
    required Function() action,
  }) {
    final dimension = MediaQuery.of(ctx).size.width / 5;

    return InkWell(
      onTap: action,
      splashColor: Theme.of(ctx).colorScheme.secondary.withOpacity(0.2),
      overlayColor: MaterialStatePropertyAll(
        Theme.of(ctx).colorScheme.onPrimary.withOpacity(0.8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Container(
            width: dimension,
            height: dimension,
            decoration: BoxDecoration(
              color: Theme.of(ctx).primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(color: Theme.of(ctx).primaryColor),
          ),
        ],
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
                      fontSize: 40,
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _customButton(
                              context,
                              name: 'አመልካች',
                              action: () => Navigator.of(context).pushNamed(
                                AttendanceRecordingScreen.routeName,
                              ),
                            ),
                          ),
                          Expanded(
                            child: _customButton(
                              context,
                              name: 'ሪፖርት',
                              action: () {},
                            ),
                          ),
                          Expanded(
                            child: _customButton(
                              context,
                              name: 'የተማሪ መረጃ',
                              action: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _customButton(
                              context,
                              name: 'ተማሪ ጨምር',
                              action: () => Navigator.of(context)
                                  .pushNamed(NewStudentScreen.routeName),
                            ),
                          ),
                          Expanded(
                            child: _customButton(
                              context,
                              name: 'መልእክት',
                              action: () {},
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ],
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
