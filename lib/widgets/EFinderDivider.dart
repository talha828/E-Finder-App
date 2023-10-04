
import 'package:e_finder/constant/constant.dart';
import 'package:flutter/material.dart';

class EFinderDivider extends StatelessWidget {
  const EFinderDivider({
    super.key,
    required this.width,
    required this.label,
  });

  final double width;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Divider(
          color: Colors.grey.withOpacity(0.2), // Customize the color of the divider
        ), // Adjust the spacing as needed
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          color: Colors.white,
          child: Text(
            label,
            style: TextStyle(// Customize the font size
                fontWeight: FontWeight.w300,
                color: themeColor1.withOpacity(0.5)// Customize the font weight
            ),
          ),
        ),
      ],
    );
  }
}
