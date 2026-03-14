import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final String textContent;
  final double fontSize;

  const Button({
    super.key,
    required this.onPressed,
    this.textContent = '',
    this.fontSize = 20.0
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed, 
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            backgroundColor: getColor('background'),
            foregroundColor: getColor('text-ui'),
            textStyle: TextStyle(fontSize: 20, fontFamily: 'JetBrains Mono', overflow: TextOverflow.ellipsis),
            elevation: 0,
          ),
          child: Text(widget.textContent),
          onPressed: () {}
        )
      )
    );
  }
}