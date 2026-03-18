import 'package:flutter/material.dart';
import 'package:tomat_os/state/window_state.dart';
import 'package:tomat_os/core/theme/colors.dart';

class CurrentApp extends StatefulWidget {
  const CurrentApp({super.key});

  @override
  State<CurrentApp> createState() => _CurrentAppState();
}

class _CurrentAppState extends State<CurrentApp> {
  @override
  Widget build(BuildContext context) {
    final apps = deskApps[deskIdx]["apps"] as List?;
    final current = deskApps[deskIdx]["current"] as int? ?? 0;

    if (apps == null || apps.isEmpty || current >= apps.length) {
      return Center(
        child: Text(
          'Ouvrez une application',
          style: TextStyle(
            color: getColor("divider-color"),
            fontFamily: 'Inter',
            fontSize: 32.0,
          ),
        ),
      );
    }

    return apps[current];
  }
}