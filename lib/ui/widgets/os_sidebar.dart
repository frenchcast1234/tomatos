import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';

void showSidebar(BuildContext context) {
  OverlayState overlayState = Overlay.of(context);
  
  OverlayEntry overlayEntry = OverlayEntry(
    opaque: true,
    builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Sidebar(),
      );
    },
  );

  overlayState.insert(overlayEntry);
}

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: getColor('background-color').withAlpha(180),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width * 0.8
                : 240,
            height: double.infinity,
            color: Colors.red,
            child: const Center(
              child: Text("Hello world"),
            ),
          ),
        ),
      ],
    );
  }
}