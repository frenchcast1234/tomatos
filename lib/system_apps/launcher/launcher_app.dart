import 'package:flutter/material.dart';
import 'package:tomat_os/ui/widgets/os_modal_bottom_sheet.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'package:tomat_os/ui/widgets/os_text_input.dart';
import 'package:tomat_os/constants/system_sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextInput(

                  ),
                  // SizedBox(height: getSizeOf("space-between-buttons", "height")),
                ],
              )
            ),
          );
        } 
      },
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/system/uni-logo.svg',
          height: 512.0,
          width: 512.0,
          colorFilter: ColorFilter.mode(getColor("divider-color"), BlendMode.srcIn),
        )
      ), 
    );
  }
}