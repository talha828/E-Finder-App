import 'package:e_finder/constant/constant.dart';
import 'package:e_finder/generated/assets.dart';
import 'package:e_finder/widgets/EFinderButton.dart';
import 'package:e_finder/widgets/EFinderTextField.dart';
import 'package:e_finder/widgets/RoundedCheckbox.dart';
import 'package:flutter/material.dart';

class MissingPersonComplainProfileScreen extends StatefulWidget {
  const MissingPersonComplainProfileScreen({super.key});

  @override
  State<MissingPersonComplainProfileScreen> createState() =>
      _MissingPersonComplainProfileScreenState();
}

class _MissingPersonComplainProfileScreenState
    extends State<MissingPersonComplainProfileScreen> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();

  void Function()? onTap = () {};
  String value = "";

  bool flag = false;

  bool maleSelected = false;
  bool femaleSelected = false;
  bool otherSelected = false;

  bool fair = false;
  bool light = false;
  bool medium = false;
  bool dark = false;

  bool single = false;
  bool married = false;
  bool window = false;
  bool divorced = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: width * 0.04, horizontal: width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                        child: Text("MISSING PERSON COMPLAIN PROFILE",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: themeColor1))),
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
                  controller: lastname,
                  label: "Last Name",
                  hintText: "Wick",
                ),
                EFinderTextField(
                  controller: mobileNumber,
                  label: "Mobile Number",
                  hintText: "000 - 000 - 000",
                  isDropdown: true,
                  countryCodeList: countryMobileCodes,
                ),
                EFinderTextField(
                  controller: phoneNumber,
                  label: "Phone Number",
                  hintText: "000 - 000 - 000",
                  isDropdown: true,
                  countryCodeList: countryMobileCodes,
                  value: value,
                ),
                EFinderTextField(
                  controller: email,
                  label: "Email Address",
                  hintText: "example@gmail.com",
                ),
                SizedBox(
                  height: width * 0.08,
                ),
                GestureDetector(
                  onTap: ()=>setState(()=>flag= !flag),
                  child: Row(
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
                ),
                const Divider(color: themeColor2),
                Visibility(
                  visible: flag,
                  child: Column(
                    children: [
                      EFinderTextField(
                        controller: firstname,
                        label: "Date Of Birth",
                        hintText: "DD  /  MM  /  YYYY",
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Gender'),
                          const SizedBox(width: 10,),
                          const Text('Male'),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                maleSelected = value;
                                femaleSelected = !value;
                                otherSelected = !value;
                              });
                            },
                          ),
                          const Text('Female'),
                          RoundedCheckbox(
                            isChecked: femaleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                maleSelected = !value;
                                femaleSelected = value;
                                otherSelected = !value;
                              });
                            },
                          ),
                          const Text('Other'),
                          RoundedCheckbox(
                            isChecked: otherSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                maleSelected = !value;
                                femaleSelected = !value;
                                otherSelected = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Height",
                            style: TextStyle(
                                color: themeColor1,
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w300),
                          ),
                          Image.asset(Assets.iconHeight)
                        ],
                      ),
                      const Divider(color: themeColor2),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Complexion",
                            style: TextStyle(
                                color: themeColor1,
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Fair',style: TextStyle(fontSize: 11),),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                fair = value;
                                light = !value;
                                medium = !value;
                                dark = !value;
                              });
                            },
                          ),
                          const Text('Light Brown',style: TextStyle(fontSize: 11),),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                fair = !value;
                                light = value;
                                medium = !value;
                                dark = !value;
                              });
                            },
                          ),
                          const Text('Medium Brown',style: TextStyle(fontSize: 11),),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                fair = !value;
                                light = !value;
                                medium = value;
                                dark = !value;
                              });
                            },
                          ),
                          const Text('Dark',style: TextStyle(fontSize: 11),),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                fair = !value;
                                light = !value;
                                medium = !value;
                                dark = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Divider(),
                      const SizedBox(height: 10,),
                      EFinderTextField(
                        controller: firstname,
                        label: "Nationality",
                        hintText: "Pakistani",
                      ),
                      const SizedBox(height: 10,),
                      const Divider(),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Marital Status",
                            style: TextStyle(
                                color: themeColor1,
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Single',style: TextStyle(fontSize: 11),),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                single = value;
                                married = !value;
                                window = !value;
                                divorced = !value;
                              });
                            },
                          ),
                          const Text('Married',style: TextStyle(fontSize: 11),),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                single = !value;
                                married = value;
                                window = !value;
                                divorced = !value;
                              });
                            },
                          ),
                          const Text('Window',style: TextStyle(fontSize: 11),),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                single = !value;
                                married = !value;
                                window = value;
                                divorced = !value;
                              });
                            },
                          ),
                          const Text('Divorced',style: TextStyle(fontSize: 11),),
                          RoundedCheckbox(
                            isChecked: maleSelected,
                            borderColor: themeColor2,
                            checkColor: themeColor1,
                            onChecked: (value) {
                              setState(() {
                                single = !value;
                                married = !value;
                                window = !value;
                                divorced = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Divider(),
                      const SizedBox(height: 10,),
                      EFinderTextField(
                        controller: firstname,
                        label: "CNIC Number",
                        hintText: "12365-52478-2568",
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
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
                  height: width * 0.1,
                ),
                EFinderButton(onTap: onTap, width: width, label: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
