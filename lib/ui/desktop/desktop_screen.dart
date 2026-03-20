import 'package:flutter/material.dart';
import 'package:tomat_os/constants/system_sizes.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'package:tomat_os/ui/widgets/os_modal_bottom_sheet.dart';
import 'package:tomat_os/ui/widgets/os_time_text.dart';
import 'package:tomat_os/ui/widgets/os_battery_text.dart';
import 'package:tomat_os/system_apps/launcher/launcher_app.dart';
import 'package:tomat_os/system_apps/current_app/current_app.dart';
import 'package:tomat_os/system_apps/desks/desks_app.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  int _pageIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildPage(int index, Widget page) {
    return Offstage(
      offstage: _pageIndex != index,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: page,
      ),
    );
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
            BatteryText(),
            TimeText(),
          ],
        ),
        toolbarHeight: getSizeOf("status_bar", "height"),
        backgroundColor: getColor("background-color"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            getSizeOf("status-bar-bottom-divider", "height"),
          ),
          child: Container(
            height: getSizeOf("status-bar-bottom-divider", "height"),
            color: getColor("divider-color"),
          ),
        ),
      ),
      body: Stack(
        children: [
          _buildPage(0, const Launcher()),
          _buildPage(1, const CurrentApp()),
          _buildPage(2, const Desks()),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: getColor("divider-color"),
              width: getSizeOf("divider", "width"),
            ),
          ),
        ),
        height: 48.0,
        child: BottomNavigationBar(
          currentIndex: _pageIndex,
          selectedItemColor: getColor("text-ui-color"),
          unselectedItemColor: getColor("divider-color"),
          backgroundColor: getColor('background-color'),
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedIconTheme: const IconThemeData(size: 32.0),
          unselectedIconTheme: const IconThemeData(size: 24.0),
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.normal,
          ),
          onTap: (idx) {
            setState(() {
              _pageIndex = idx;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.launch),
              label: "Launcher",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: "App",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.desk),
              label: "Desks",
            ),
          ],
        ),
      ),
    );
  }
}