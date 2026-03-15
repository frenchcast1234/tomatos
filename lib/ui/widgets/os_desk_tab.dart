import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'package:tomat_os/constants/system_sizes.dart';
import 'package:tomat_os/ui/widgets/os_modal_bottom_sheet.dart';
import 'package:tomat_os/ui/widgets/os_button.dart';
import 'package:tomat_os/ui/widgets/os_text_input.dart';
import 'package:tomat_os/state/window_state.dart';

class DeskTab extends StatefulWidget {
  final Widget Function() content;
  final EdgeInsets padding;
  final String name;
  final bool deletable;
  final int index;
  final VoidCallback? onDelete;

  const DeskTab({
    super.key,
    required this.content,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    required this.name,
    this.deletable = true,
    this.index = 0,
    this.onDelete
  });

  @override
  State<DeskTab> createState() => _DeskTabState();
}

class _DeskTabState extends State<DeskTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (!widget.deletable) return;
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true, 
          builder: (context) => ModalBottomSheet(
            bgColor: getColor("background-color"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  deskApps[widget.index]["name"] ?? "Bureau",
                  style: TextStyle(
                    color: getColor("text-ui-color"),
                    fontFamily: 'Inter',
                    fontSize: 32.0
                  )
                ),
                SizedBox(height: 16.0),
                Button(
                  onPressed: () {
                    widget.onDelete?.call();
                    Navigator.pop(context);
                  },
                  textContent: "Delete",
                  fontSize: 24.0,
                ),
                SizedBox(height: getSizeOf("space-between-buttons", "height")),
                TextInput(
                  controller: TextEditingController(text: deskApps[widget.index]["name"] ?? "Bureau"),
                  onOk: (p0) {
                    setState(() {
                      deskApps[widget.index]["name"] = p0;
                    });
                    Navigator.pop(context);
                  } 
                )
              ],
            )
          ),
        );
      },
      child: IntrinsicWidth(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: getSizeOf("desk-tab", "width") / 2,
            maxWidth: getSizeOf("desk-tab", "width") * 2,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: getColor('background-color'),
              border: Border.all(width: getSizeOf('divider', 'width'), color: getColor('divider-color')),
              borderRadius: BorderRadius.circular(16.0)
            ),
            height: getSizeOf("desk-tab", "height"),
            alignment: Alignment.center,
            child: Padding(
              padding: widget.padding,
              child: widget.content()
            )
          ),
        ),
      ),
    );
  }
}