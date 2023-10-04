
import 'package:e_finder/constant/constant.dart';
import 'package:flutter/material.dart';

class EFinderButton extends StatelessWidget {
  const EFinderButton({
    super.key,
    required this.onTap,
    required this.width,
    required this.label,
  });

  final void Function()? onTap;
  final double width;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: themeColor1,
            borderRadius: BorderRadius.circular(50)
        ),
        child:Text(label,style: const TextStyle(color: themeColor2,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
