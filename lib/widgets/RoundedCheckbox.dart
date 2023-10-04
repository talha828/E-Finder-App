
import 'package:flutter/material.dart';

class RoundedCheckbox extends StatelessWidget {
  final bool isChecked;
  final Color borderColor;
  final Color checkColor;
  final Function(bool) onChecked;

  RoundedCheckbox({
    required this.isChecked,
    required this.borderColor,
    required this.checkColor,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChecked(!isChecked);
      },
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
        ),
        child: Center(
          child: isChecked
              ? Icon(
            Icons.circle,
            size: 12,
            color: checkColor,
          )
              : null,
        ),
      ),
    );
  }
}