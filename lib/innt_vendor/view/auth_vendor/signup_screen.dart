import 'dart:io';

import 'package:demo_innt/innt_vendor/view/auth_vendor/signUp_second.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/controller.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../innt_delivery/base/custom_button.dart';
import '../../../ulits/utils.dart';
import '../Api/Seller_signup_api.dart';

class SignUpScreenVendor extends StatefulWidget {
  const SignUpScreenVendor({super.key});

  @override
  State<SignUpScreenVendor> createState() => _SignUpScreenVendorState();
}

class _SignUpScreenVendorState extends State<SignUpScreenVendor> {
  GetxControllers controller = Get.put(GetxControllers());
  final Signup_api = Get.put(Signupapi());
  var ll = 8;
  var contrycode = "226";
  final formKey = GlobalKey<FormState>();

  String? valueChoose;
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedTime1;
  DateTime? selectedTime2;
  DateTime? selectedTime3;
  File? _logoImage;
  File? _coverImage;
  File? upload_backsideId;

  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromCamera(ImageSource source, bool isLogo) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          _logoImage = File(pickedFile.path);
        } else {
          _coverImage = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _getImageFromCamera1(ImageSource source, bool isLogo) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          _logoImage = File(pickedFile.path);
        } else {
          upload_backsideId = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h / 60,
                ),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Ember_Display_Medium'),
                ),
                SizedBox(height: h / 40),
                Row(
                  children: [
                    Text("First name", style: smallText),
                    SizedBox(
                      width: w / 100,
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          color: customColor,
                          fontSize: 14,
                          fontFamily: "Ember_Medium",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 100,
                ),
                TextFormField(
                  controller: Signup_api.firstNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please entre first name";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Enter your first name",
                    contentPadding: const EdgeInsets.all(12),
                    filled: true,
                    fillColor: Colors.white12,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: h / 60),
                Row(
                  children: [
                    Text("Last name", style: smallText),
                    SizedBox(
                      width: w / 100,
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          color: customColor,
                          fontSize: 14,
                          fontFamily: "Ember_Medium",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 100,
                ),
                TextFormField(
                  controller: Signup_api.lastNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please entre last name";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Enter your first name",
                    contentPadding: const EdgeInsets.all(12),
                    filled: true,
                    fillColor: Colors.white12,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: h / 60),
                Row(
                  children: [
                    Text("Date of birth", style: smallText),
                    SizedBox(
                      width: w / 100,
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          color: customColor,
                          fontSize: 14,
                          fontFamily: "Ember_Medium",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 100,
                ),
                TextFormField(
                  controller: Signup_api.dobController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please entre Dob ";
                    } else {
                      return null;
                    }
                  },
                  readOnly: true,
                  onTap: () {
                    _showDatePicker();
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month),
                    contentPadding: const EdgeInsets.all(12),
                    filled: true,
                    fillColor: Colors.white12,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: h / 60),
                // Row(
                //   children: [
                //     Text("Residence city", style: smallText),
                //     SizedBox(
                //       width: w / 100,
                //     ),
                //     Text(
                //       "*",
                //       style: TextStyle(
                //           color: customColor,
                //           fontSize: 14,
                //           fontFamily: "Ember_Medium",
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: h / 100,
                // ),
                // TextFormField(
                //   controller: Signup_api.residencyController,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "Please entre Residence city";
                //     } else {
                //       return null;
                //     }
                //   },
                //   textInputAction: TextInputAction.next,
                //   keyboardType: TextInputType.name,
                //   decoration: InputDecoration(
                //     contentPadding: const EdgeInsets.all(12),
                //     filled: true,
                //     fillColor: Colors.white12,
                //     focusedBorder: OutlineInputBorder(
                //         borderSide:
                //             const BorderSide(color: Colors.black, width: 1),
                //         borderRadius: BorderRadius.circular(10)),
                //     enabledBorder: OutlineInputBorder(
                //         borderSide:
                //             const BorderSide(color: Colors.grey, width: 1),
                //         borderRadius: BorderRadius.circular(10)),
                //     border: OutlineInputBorder(
                //         borderSide:
                //             const BorderSide(color: Colors.grey, width: 1),
                //         borderRadius: BorderRadius.circular(10)),
                //   ),
                // ),
                // SizedBox(height: h / 60),
                Row(
                  children: [
                    Text("Phone number", style: smallText),
                    SizedBox(
                      width: w / 100,
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          color: customColor,
                          fontSize: 14,
                          fontFamily: "Ember_Medium",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 100,
                ),
                IntlPhoneField(
                  dropdownDecoration: BoxDecoration(shape: BoxShape.circle),
                  initialCountryCode: "BF",
                  onCountryChanged: (value) {
                    setState(() {
                      ll = value.maxLength;
                    });
                  },
                  controller: Signup_api.mobileController,
                  validator: (value) {
                    if (value == null) {
                      return "please mobile";
                    }
                    return null;
                  },
                  pickerDialogStyle: PickerDialogStyle(
                    backgroundColor: Color(0xffffffff),
                  ),
                  flagsButtonPadding: const EdgeInsets.all(5),
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(12),
                      filled: true,
                      counterText: "",
                      // hintText: 'Mobile Number',
                      // hintStyle: A_style_mid,
                      //labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10))
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide:
                      //     BorderSide(color: Colors.redAccent.shade700, width: 1),
                      //borderRadius: BorderRadius.circular(10)),
                      ),
                ),
                SizedBox(height: h / 60),
                Text("Email", style: smallText),
                SizedBox(
                  height: h / 100,
                ),
                TextFormField(
                  controller: Signup_api.emailController,
                  validator: (value) {
                    if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return null;
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") !=
                        value!) {
                      return "Please entre email correct";
                    } else {
                      return "Please entre email ";
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    filled: true,
                    fillColor: Colors.white12,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: h / 60),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text(
                                'Take a Photo',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Ember_Display_Medium'),
                              ),
                              onTap: () {
                                _getImageFromCamera(ImageSource.camera, false);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text(
                                'Choose from Gallery',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Ember_Display_Medium'),
                              ),
                              onTap: () {
                                _getImageFromCamera(ImageSource.gallery, false);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }, // _coverImage
                  child: DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1,
                    dashPattern: const [
                      5,
                      5,
                    ],
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          // border: Border.all(color: Colors.black87, width: 0.5)
                          ),
                      child: _coverImage != null
                          ? Image.file(
                              _coverImage!,
                              fit: BoxFit.cover,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: h / 60,
                                ),
                                Icon(
                                  Icons.cloud_upload_outlined,
                                  // Replace with your desired icon
                                  size: h / 12.9,
                                  color: Colors.grey, // Icon color
                                ),
                                SizedBox(
                                  height: h / 60,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Upload front side ID",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Ember_Display_Medium'),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                          color: customColor,
                                          fontSize: 14,
                                          fontFamily: "Ember_Medium",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                SizedBox(height: h / 40),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text(
                                'Take a Photo',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Ember_Display_Medium'),
                              ),
                              onTap: () {
                                _getImageFromCamera1(ImageSource.camera, false);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text(
                                'Choose from Gallery',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Ember_Display_Medium'),
                              ),
                              onTap: () {
                                _getImageFromCamera1(
                                    ImageSource.gallery, false);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }, // _coverImage
                  child: DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1,
                    dashPattern: const [
                      5,
                      5,
                    ],
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          // border: Border.all(color: Colors.black87, width: 0.5)
                          ),
                      child: upload_backsideId != null
                          ? Image.file(
                              upload_backsideId!,
                              fit: BoxFit.cover,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: h / 60,
                                ),
                                Icon(
                                  Icons.cloud_upload_outlined,
                                  // Replace with your desired icon
                                  size: h / 12.9,
                                  color: Colors.grey, // Icon color
                                ),
                                SizedBox(
                                  height: h / 60,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Upload back side ID",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Ember_Display_Medium'),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                          color: customColor,
                                          fontSize: 14,
                                          fontFamily: "Ember_Medium",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                SizedBox(height: h / 40),
                CustomButton(
                    title: 'Continue',
                    onTap: () {
                      if (Signup_api.mobileController.text.length != ll) {
                        Utils().alertbox(' Please entre mobile no upto $ll');
                      } else if (_coverImage == null ||
                          upload_backsideId == null) {
                        Utils().alertbox(' Please Upload image');
                      } else if (age <= 14) {
                        Utils().alertbox(
                            ' You must be at least 14 years old to use this app. ');
                      } else if (formKey.currentState!.validate()) {
                        Get.to(() => SignUpSecondVendor(
                              frontid: _coverImage!.path,
                              backid: upload_backsideId!.path,
                            ));
                        // Signup_api.signupApi(
                        //     fullNameController.text.toString(),
                        //     nickNameController.text.toString(),
                        //     emailController.text.toString(),
                        //     codeController.text.toString(),
                        //     passwordController.text.toString(),
                        //     confirmpasswordController.text.toString(),
                        //     referralController.text.toString(),
                        //     "FCMID".toString(),
                        //     controller.imagePath.value.toString(),
                        //     contrycode.toString());
                      } else {
                        return null;
                      }
                    }),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Text(
                          "Back",
                          style: A_style_medium,
                        ),
                      ),
                    )),
                SizedBox(height: h / 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2200),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: logocolo, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: logocolo, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        Signup_api.dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
      calculateAge(pickedDate);
    }
  }

  int calculateAge(DateTime? birthDate) {
    if (birthDate == null) return 0;
    DateTime currentDate = DateTime.now();
    age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1 ||
        (month1 == month2 && birthDate.day > currentDate.day)) {
      age--;
    }
    print("age $age");
    return age;
  }
}

int age = 0;
