import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'package:tomat_os/constants/system_sizes.dart';

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final String textContent;
  final double fontSize;
  final Alignment align;

  const Button({
    super.key,
    required this.onPressed,
    this.textContent = '',
    this.fontSize = 20.0,
    this.align = Alignment.centerLeft,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSizeOf("button", "height"),
      width: getSizeOf("button", "width"),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: widget.align,
          backgroundColor: getColor('background-color'),
          foregroundColor: getColor('text-ui-color'),
          textStyle: TextStyle(fontSize: widget.fontSize, fontFamily: 'Inter', overflow: TextOverflow.ellipsis),
          elevation: 0,
        ),
        onPressed: widget.onPressed,
        child: Text(widget.textContent),
      )
    );
  }
}