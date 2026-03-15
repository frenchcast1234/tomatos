import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'package:tomat_os/constants/system_sizes.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onOk;

  const TextInput({
    super.key,
    this.controller,
    this.onOk
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSizeOf("text-input", "width"),
      height: getSizeOf("text-input", "height"),
      padding: EdgeInsets.only(left: 22.0),
      decoration: BoxDecoration(
        color: getColor("background-color"),
        border: BoxBorder.all(color: getColor("divider-color"), width: getSizeOf("divider", "width")),
        borderRadius: BorderRadius.circular(100.0)
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        onSubmitted: onOk,
        style: TextStyle(
          color: getColor("text-ui-color"),
          fontSize: 14.0,
          fontFamily: 'Inter'
        ),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}