import 'package:flutter/material.dart';
import 'package:tomat_os/ui/widgets/os_modal_bottom_sheet.dart';
import 'package:tomat_os/core/theme/colors.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}