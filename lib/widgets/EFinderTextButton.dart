
import 'package:e_finder/constant/constant.dart';
import 'package:flutter/material.dart';

class EFinderTextButton extends StatelessWidget {
  const EFinderTextButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.label,
  });

  final String text;
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: textTheme1,),
        const SizedBox(width: 5,),
        GestureDetector(
            onTap: onTap,
            child: Text(label,style: textTheme2,)),
      ],
    );
  }
}
