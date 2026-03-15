import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'dart:async';
import 'package:battery_plus/battery_plus.dart';

class BatteryText extends StatefulWidget {
  const BatteryText({super.key});

  @override
  State<BatteryText> createState() => _BatteryTextState();
}

class _BatteryTextState extends State<BatteryText> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    
    _updateBatteryLevel();

    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        _updateBatteryLevel();
      });
    });
  }

  Future<void> _updateBatteryLevel() async {
    final level = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_batteryLevel%',
      style: TextStyle(
        color: getColor("text-ui-color"),
        fontSize: 12.0
      )
    );
  }
}