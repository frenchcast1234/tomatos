import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tomat_os/constants/system_sizes.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:tomat_os/ui/widgets/os_modal_bottom_sheet.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  late DateTime _now;
  late Timer _timer;
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _updateBatteryLevel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });

    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        _now = DateTime.now();
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
  void dispose() {
    _timer.cancel(); 
    super.dispose();
  }

  String _formatTime(DateTime dt) {
    String h = dt.hour.toString().padLeft(2, '0');
    String m = dt.minute.toString().padLeft(2, '0');
    String s = dt.second.toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: getColor("background-color"),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$_batteryLevel%',
              style: TextStyle(
                color: getColor("text-ui-color"),
                fontSize: 12.0
              )
            ),
            Text(
              _formatTime(_now),
              style: TextStyle(
                color: getColor("text-ui-color"),
                fontSize: 12.0
              )
            )
          ],
        ),
        toolbarHeight: getSizeOf("status_bar", "height"),
        backgroundColor: getColor("background-color"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(getSizeOf("status-bar-bottom-divider", "height")), 
          child: Container(
            height: getSizeOf("status-bar-bottom-divider", "height"),
            color: getColor("divider-color"),
          ),
        ),
      ),
      body: GestureDetector(
        onPanEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy < 0) {
            // Swipe vers le bas → ouvrir bottom sheet
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent, // pour respecter les coins arrondis
              isScrollControlled: true, // permet de s’adapter au contenu
              builder: (context) => ModalBottomSheet(
                bgColor: getColor("background-color"),
                content: Center(
                  child: Text(
                    'Hello world!',
                    style: TextStyle(color: getColor("text-ui-color")),
                  ),
                ),
              ),
            );
          } 
        },
        child: Container(color: Colors.transparent), // besoin d’un child pour GestureDetector
      )
    );
  }
}