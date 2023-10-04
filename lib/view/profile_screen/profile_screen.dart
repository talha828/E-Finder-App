import 'package:e_finder/constant/constant.dart';
import 'package:e_finder/generated/assets.dart';
import 'package:e_finder/widgets/EFinderButton.dart';
import 'package:e_finder/widgets/EFinderTextField.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController mobileNumber = TextEditingController(text: "+92");
  void Function()? onTap = () {};
  String value = "";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("USER PROFILE", style: headingStyle),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: onTap, //TODO:: Here....
                        child: CircleAvatar(
                          radius: width * 0.07,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset(Assets.iconProfile),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Add Picture",
                        style: textTheme1,
                      ),
                    ],
                  ),
                ],
              ),
              EFinderTextField(
                controller: firstname,
                label: "First Name",
                hintText: "John",
              ),
              EFinderTextField(
                controller: firstname,
                label: "Last Name",
                hintText: "Wick",
              ),
              EFinderTextField(
                controller: firstname,
                label: "Mobile Number",
                hintText: "000 - 000 - 000",
                isDropdown: true,
                countryCodeList: countryMobileCodes,
              ),
              EFinderTextField(
                controller: firstname,
                label: "Phone Number",
                hintText: "000 - 000 - 000",
                isDropdown: true,
                countryCodeList: countryMobileCodes,
                value: value,
              ),
              EFinderTextField(
                controller: firstname,
                label: "Email Address",
                hintText: "example@gmail.com",
              ),
              SizedBox(
                width: width * 0.1,
              ),
              Row(
                children: [
                  Text(
                    "Address Details",
                    style: TextStyle(
                        color: themeColor1,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  const Icon(
                    Icons.add_circle_outline_outlined,
                    color: themeColor1,
                  ),
                ],
              ),
              const Divider(color: themeColor2),
              Row(
                children: [
                  Text(
                    "Additional Details",
                    style: TextStyle(
                        color: themeColor1,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  const Icon(
                    Icons.add_circle_outline_outlined,
                    color: themeColor1,
                  ),
                ],
              ),
              const Divider(color: themeColor2),
              SizedBox(
                width: width * 0.1,
              ),
              EFinderButton(onTap: onTap, width: width, label: "Submit")
            ],
          ),
        ),
      ),
    );
  }
}
