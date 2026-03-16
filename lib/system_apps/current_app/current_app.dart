import 'package:flutter/material.dart';
import 'package:tomat_os/state/window_state.dart';

class CurrentApp extends StatefulWidget {
  const CurrentApp({super.key});

  @override
  State<CurrentApp> createState() => _CurrentAppState();
}

class _CurrentAppState extends State<CurrentApp> {
  @override
  Widget build(BuildContext context) {
    return deskApps[deskIdx]["apps"][deskApps[deskIdx]["current"]];
  }
}