import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/controller.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../innt_delivery/base/custom_button.dart';
import '../../../ulits/utils.dart';
import '../../innt_vendor/view/Api/Seller_signup_api.dart';
import '../../innt_vendor/view/auth_vendor/map_screen.dart';
import '../Api/Signupderlivery.dart';
import 'delivery_login.dart';

class SignUpScreenDelivery extends StatefulWidget {
  const SignUpScreenDelivery({super.key});

  @override
  State<SignUpScreenDelivery> createState() => _SignUpScreenDeliveryState();
}

class _SignUpScreenDeliveryState extends State<SignUpScreenDelivery> {
  GetxControllers controller = Get.put(GetxControllers());
  final Signup_api = Get.put(Signupapidevilery());
  var ll = 8;
  var contrycode = "226";
  final formKey = GlobalKey<FormState>();
  final Signup_api1 = Get.put(Signupapi());
  String? valueChoose;
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedTime1;
  DateTime? selectedTime2;
  DateTime? selectedTime3;
  File? _logoImage;

  File? fornyidimage;
  File? backidimage;
  File? vechilimage;
  File? registrationimage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromCamera(ImageSource source, bool isLogo) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          _logoImage = File(pickedFile.path);
        } else {
          fornyidimage = File(pickedFile.path);
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
          backidimage = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _getImageFromCamera2(ImageSource source, bool isLogo) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          _logoImage = File(pickedFile.path);
        } else {
          vechilimage = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _getImageFromCamera3(ImageSource source, bool isLogo) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          _logoImage = File(pickedFile.path);
        } else {
          registrationimage = File(pickedFile.path);
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
                    Text("Residence city", style: smallText),
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
                  controller: Signup_api.residencyController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please entre Residence city";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10))),
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
                Text(
                  "home location",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Ember_Medium",
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: h / 100),
                GestureDetector(
                  onTap: () async {
                    Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high,
                    );

                    double latitude = position.latitude;
                    double longitude = position.longitude;
                    Get.to(() => MapScreen1(
                      lat: latitude,
                      lon: longitude,
                    ));
                  },
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Obx(() => Center(
                        child: Signup_api1.address.value != "Address not found "
                            ? FittedBox(
                          child: Text(
                            maxLines: 4,
                            "${Signup_api1.address.value}",
                            softWrap: true,
                            style: A_style_medium,
                          ),
                        )
                            : Text(
                          "Select location",
                          style: A_style_medium,
                        ))),
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
                      child: fornyidimage != null
                          ? Image.file(
                              fornyidimage!,
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
                      child: backidimage != null
                          ? Image.file(
                              backidimage!,
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
                                _getImageFromCamera2(ImageSource.camera, false);
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
                                _getImageFromCamera2(
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
                      child: vechilimage != null
                          ? Image.file(
                              vechilimage!,
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
                                      "Upload vehicle image",
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
                                _getImageFromCamera3(ImageSource.camera, false);
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
                                _getImageFromCamera3(
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
                      child: registrationimage != null
                          ? Image.file(
                              registrationimage!,
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
                                      "Upload vehicle registration document",
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
                    title: 'Done',
                    onTap: () {
                      //  Get.to(DeliverySignupOtp());

                      if (Signup_api.mobileController.text.length != ll) {
                        Utils().alertbox(' Please entre mobile no upto $ll');
                      } else if (fornyidimage == null ||
                          backidimage == null ||
                          vechilimage == null ||
                          registrationimage == null) {
                        Utils().alertbox(' Please Upload image');
                      } else if (age <= 14) {
                        Utils().alertbox(
                            ' You must be at least 14 years old to use this app. ');
                      }
                      else if (Signup_api1.address.value == "Address not found ") {
                        Utils().alertbox(
                            ' Please select location');
                      }

                      else if (formKey.currentState!.validate()) {
                        Signup_api.signupApi(
                            backid: backidimage!.path,
                            frontid: fornyidimage!.path,
                            registratinimage: registrationimage!.path,
                            vechileimage: vechilimage!.path);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Ember_Light",
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DeliveryLogin());
                      },
                      child: Text(
                        " Sign in",
                        style: TextStyle(
                            color: Colors.blue.shade700,
                            fontSize: 16,
                            fontFamily: 'Ember_Display_Medium'),
                      ),
                    ),
                  ],
                ),
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
