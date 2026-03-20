import 'package:flutter/material.dart';
import 'package:tomat_os/state/window_state.dart';
import 'package:tomat_os/core/theme/colors.dart';

class CurrentApp extends StatelessWidget {
  const CurrentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: windowStateNotifier, // 👈 écoute les changements
      builder: (context, _, __) {
        final apps = deskApps[deskIdx]["apps"] as List?;
        final current = deskApps[deskIdx]["current"] as int? ?? 0;

        if (apps == null || apps.isEmpty || current >= apps.length) {
          return SizedBox.expand(
            child: Center(
              child: Text(
                'Ouvrez une application',
                style: TextStyle(
                  color: getColor("divider-color"),
                  fontFamily: 'Inter',
                  fontSize: 32.0,
                ),
              ),
            ),
          );
        }

        return SizedBox.expand(
          child: apps[current],
        );
      },
    );
  }
}