import 'dart:io';

import 'package:demo_innt/ulits/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/controller.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../../../innt_delivery/base/custom_button.dart';
import '../../../api_constant/get_vendorprofile_api.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  GetxControllers controller = Get.put(GetxControllers());
  TextEditingController firstNameController = TextEditingController(
    text: "${vendorProfileList[0]["firstName"]}",
  );
  TextEditingController mobileController =
      TextEditingController(text: "${vendorProfileList[0]["mobile_number"]}");
  TextEditingController lastNameController =
      TextEditingController(text: "${vendorProfileList[0]["lastName"]}");

  //TextEditingController shopNoController = TextEditingController();
  TextEditingController emailController =
      TextEditingController(text: "${vendorProfileList[0]["email"]}");

//  TextEditingController lastNameController = TextEditingController(text: "${vendorProfileList[0]["lastName"]}");TextEditingController shopNoController = TextEditingController();

  final getVendorProfile1 = Get.put(fetchVendorProfile());
  String? valueChoose;

  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedTime1;
  DateTime? selectedTime2;
  DateTime? selectedTime3;
  File? _logoImage;
  File? _coverImage;
  File? _logoImage1;
  File? _coverImage1;
  var ll = 10;

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
          _logoImage1 = File(pickedFile.path);
        } else {
          _coverImage1 = File(pickedFile.path);
        }
      });
    }
  }

  List<String> listitem = ["Male", "Female", "Other"];
  bool passwordObscured = true;
  bool confirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Builder(builder: (context) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title:  Text(
              AppLocalizations.of(context)!.personal_information,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h / 80),
                Row(
                  children: [
                    Text(  AppLocalizations.of(context)!.first_name, style: A_style_medium),
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
                SizedBox(height: h / 100),
                TextFormField(
                  onTap: () {
                    print("rebuild ${vendorProfileList[0]}");
                  },
                  controller: firstNameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
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
                SizedBox(height: h / 40),
                Row(
                  children: [
                    Text(  AppLocalizations.of(context)!.last_name, style: A_style_medium),
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
                SizedBox(height: h / 100),
                TextFormField(
                  controller: lastNameController,
                  style: const TextStyle(color: Colors.black),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
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
                SizedBox(height: h / 40),
                Row(
                  children: [
                    Text(  AppLocalizations.of(context)!.phone, style: A_style_medium),
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
                SizedBox(height: h / 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: w / 1.4,
                      child: IntlPhoneField(
                        onCountryChanged: (value) {
                          setState(() {
                            ll = value.maxLength;
                          });
                        },
                        controller: mobileController,
                        style: const TextStyle(color: Colors.black),
                        flagsButtonPadding: const EdgeInsets.all(8),
                        decoration: InputDecoration(
                          //  hintText: "Mobile Number",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        initialCountryCode: 'IN',
                        onSubmitted: (phone) {
                          if (phone != null &&
                              phone.contains(RegExp(r'[0-5]'))) {
                            // Entered number contains 0, 1, 2, 3, 4, or 5
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please enter a valid number.',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Ember_Display_Medium'),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          getVendorProfile1
                              .vendorPromo(mobileController.text.toString());
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(color: logocolo),
                        ))
                  ],
                ),
                SizedBox(height: h / 40),
                 Text(  AppLocalizations.of(context)!.email,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Ember_Display_Medium',
                    )),
                SizedBox(height: h / 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: w / 1.4,
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value!.length < 10) {
                            return "Invalid email address";
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Update",
                          style: TextStyle(color: logocolo),
                        ))
                  ],
                ),
                SizedBox(height: h / 40),
                 Text(  AppLocalizations.of(context)!.upload_front_id,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Ember_Display_Medium',
                    )),
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
                      height: 150,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          // border: Border.all(color: Colors.black87, width: 0.5)
                          ),
                      child: _coverImage != null
                          ? Image.file(
                              _coverImage!,
                              fit: BoxFit.cover,
                            )
                          : vendorProfileList == null ||
                                  vendorProfileList
                                      .isEmpty // Added null and length check
                              ? const Text('no image')
                              : vendorProfileList[0]["upload_frontId"] != null
                                  ? Image.network(
                                      "$image_url${vendorProfileList[0]["upload_frontId"]}")
                                  : const Text("No Image"),
                    ),
                  ),
                ),
                SizedBox(height: h / 40),
                 Text(  AppLocalizations.of(context)!.upload_back_id,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Ember_Display_Medium',
                    )),
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
                      child: _coverImage1 != null
                          ? Image.file(
                              _coverImage1!,
                              fit: BoxFit.cover,
                            )
                          : vendorProfileList == null ||
                                  vendorProfileList
                                      .isEmpty // Added null and length check
                              ? const Text('no image')
                              : vendorProfileList[0]["upload_backsideId"] !=
                                      null
                                  ? Image.network(
                                      "$image_url${vendorProfileList[0]["upload_backsideId"]}")
                                  : Text("No image"),
                    ),
                  ),
                ),
                SizedBox(
                  height: h / 40,
                ),
                Obx(() => getVendorProfile1.loading.value == true
                    ? Center(
                        child: CircularProgressIndicator(color: logocolo),
                      )
                    : CustomButton(
                        title:  AppLocalizations.of(context)!.update,
                        onTap: () {
                          getVendorProfile1.vendorProdate(
                              firstNameController.text.toString(),
                              lastNameController.text.toString(),
                              _coverImage?.path ?? "0",
                              _coverImage1?.path ?? "0");
                          // Get.to(() => UpdateOtp());
                        })),
                SizedBox(
                  height: h / 80,
                ),
              ],
            ),
          ));
    });
  }
}
