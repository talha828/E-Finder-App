import 'package:e_finder/constant/constant.dart';
import 'package:e_finder/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EFinderTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? prefixIconWidget;
  final dynamic suffixIcon;
  final IconData? suffixIconData;
  final bool isDropdown;
  final List<String>? countryCodeList;

  const EFinderTextField(
      {required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.suffixIconData,
      required this.label,
      this.prefixIconWidget,
      this.obscureText = false,
      this.suffixIcon,
      this.isDropdown = false,
      this.countryCodeList,
      super.key});

  @override
  State<EFinderTextField> createState() => _EFinderTextFieldState();
}

class _EFinderTextFieldState extends State<EFinderTextField> {
  bool obscureText = false;
  void _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.04,
              color: textColor),
        ),
        SizedBox(height: width * 0.04),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: fillColor,
          ),
          child: Row(
            children: [
              // Prefix Icon or Dropdown
              Container(
                padding: const EdgeInsets.all(8.0),
                child: widget.isDropdown
                    ? DropdownButton<String>(
                        value: widget.controller.text,
                        onChanged: (newValue) {
                          widget.controller.text = newValue!;
                        },
                        items: widget.countryCodeList!.map((String countryCode) {
                          return DropdownMenuItem<String>(
                            value: countryCode,
                            child: Text(countryCode),
                          );
                        }).toList(),
                      )
                    : Icon(
                        widget.prefixIcon,
                        color: themeColor1.withOpacity(0.2),
                      ),
              ),
              // Text Input Field
              Expanded(
                child: TextField(
                  obscureText: obscureText,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: textColor,
                        fontSize: width * 0.04,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ),
              ),
              // Suffix Icon
              if (widget.suffixIcon != null)
                Container(
                  padding:const EdgeInsets.all(8.0),
                  child: widget.suffixIcon is IconData
                      ? GestureDetector(
                    onTap: widget.obscureText ? _togglePasswordVisibility : (){},
                        child: obscureText? Icon(
                     widget.suffixIcon,
                    size: 24.0, // Adjust the size as needed
                    color: textColor,
                  ) :Image.asset(
                          Assets.iconHideEye,
                          width: 24.0, // Adjust the size as needed
                          height: 24.0, // Adjust the size as needed
                        ),
                      )
                      : Image.asset(
                    widget.suffixIcon,
                    width: 24.0, // Adjust the size as needed
                    height: 24.0, // Adjust the size as needed
                  ),
                ),
              // If suffixIcon is null, use an empty SizedBox
            ],
          ),
        ),
      ],
    );
  }
}
