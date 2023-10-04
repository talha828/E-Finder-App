import 'package:e_finder/constant/constant.dart';
import 'package:e_finder/widgets/EFinderButton.dart';
import 'package:e_finder/widgets/EFinderTextField.dart';
import 'package:flutter/material.dart';

class OrganizationProfileScreen extends StatefulWidget {
  const OrganizationProfileScreen({super.key});

  @override
  State<OrganizationProfileScreen> createState() =>
      _OrganizationProfileScreenState();
}

class _OrganizationProfileScreenState extends State<OrganizationProfileScreen> {
  TextEditingController cname = TextEditingController();
  TextEditingController pname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  String value = " ";

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "MISSING PERSON COMPLAIN PROFILE",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: themeColor1),
              ),
              SizedBox(height: width * 0.04,),
              EFinderTextField(
                controller: cname,
                label: "Company Name",
                hintText: "Name",
              ),
              EFinderTextField(
                controller: pname,
                label: "Contact Person Full name",
                hintText: "Name",
              ),
              EFinderTextField(
                controller: phoneNumber,
                label: "Company Phone number",
                hintText: "000 - 000 - 000",
                isDropdown: true,
                countryCodeList: countryMobileCodes,
                value: value,
              ),
              EFinderTextField(
                controller: phoneNumber,
                label: "Contact Person Phone number",
                hintText: "000 - 000 - 000",
                isDropdown: true,
                countryCodeList: countryMobileCodes,
                value: value,
              ),
              EFinderTextField(
                controller: phoneNumber,
                label: "Contact Person Mobile number",
                hintText: "000 - 000 - 000",
                isDropdown: true,
                countryCodeList: countryMobileCodes,
                value: value,
              ),
              EFinderTextField(
                controller: email,
                label: "Contact Person/Company Email Address",
                hintText: "Email",
              ),
              GestureDetector(
                onTap: () => setState(() => flag = !flag),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Company Mailing Address details",
                        style: TextStyle(
                            color: themeColor1,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w300),
                      ),
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
              ),
              const Divider(color: themeColor2),
              Visibility(
                visible: flag,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    EFinderTextField(
                      controller: email,
                      label: "Company Logo",
                      hintText: " ",
                      prefixIcon: Icons.file_copy_outlined,
                    ),
                    EFinderTextField(
                      controller: email,
                      label: "Company Website",
                      hintText: "Email",
                    ),
                    EFinderTextField(
                      controller: email,
                      label: "Description",
                      hintText: "Description",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: width * 0.1,
              ),
              EFinderButton(onTap: () {}, width: width, label: "Submit")
            ],
          ),
        ),
      ),
    ));
  }
}
