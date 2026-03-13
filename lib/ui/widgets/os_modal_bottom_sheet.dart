import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';

class ModalBottomSheet extends StatefulWidget {
  final Color bgColor;
  final Widget content;

  const ModalBottomSheet({
    super.key,
    required this.bgColor,
    required this.content
  });

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 8.0),
            height: 24.0,
            width: double.infinity,
            child: Container(
              height: 8.0,
              width: 64.0,
              decoration: BoxDecoration(
                color: getColor("divider-color"),
                borderRadius: BorderRadius.circular(4.0)
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: widget.content,
          )
        ],
      ),
    );
  }
}