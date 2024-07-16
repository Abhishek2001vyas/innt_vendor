import 'dart:async';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:demo_innt/innt_vendor/view/auth_vendor/signup_third_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter_api/google_places_flutter_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../innt_delivery/base/custom_button.dart';
import '../../../ulits/utils.dart';
import '../Api/Seller_signup_api.dart';
import 'map_screen.dart';

class SignUpSecondVendor extends StatefulWidget {
  final frontid;
  final backid;

  const SignUpSecondVendor(
      {super.key, required this.frontid, required this.backid});

  @override
  State<SignUpSecondVendor> createState() => _SignUpSecondVendorState();
}

class _SignUpSecondVendorState extends State<SignUpSecondVendor> {
  CountryCode _selectedCountry = CountryCode.fromCode('IN');
  final Signup_api = Get.put(Signupapi());
  File? _image;
  bool isloading = false;
  bool _isVerifyButtonEnabled = false;

  final List<String> _dropdownBusinessItems = [
    'Enterprise',
    'Individual',
  ];

  final List<String> _dropdownResItems = [
    'No',
    'Yes',
  ];

  late String selectedDropdownItem = '';
  int p = 0;

  File? _logoImage;

  final ImagePicker _picker = ImagePicker();

  _getImageFromCamera(
    ImageSource source,
    bool isLogo,
  ) async {
    print("iiiiii$storelogo");
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          print("poi111");
          _logoImage = File(pickedFile.path);
        } else {
          print("4444444 ${storelogo}");
          storelogo = File(pickedFile.path);
          print("4444444 ${storelogo}");
        }
      });
    }
  }

  _getImageFromCamera1(
    ImageSource source,
    bool isLogo,
  ) async {
    print("iiiiii$forntimage");
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          print("poi111");
          _logoImage = File(pickedFile.path);
        } else {
          print("4444444 ${forntimage}");
          forntimage = File(pickedFile.path);
          print("4444444 ${forntimage}");
        }
      });
    }
  }

  _getImageFromCamera2(
    ImageSource source,
    bool isLogo,
  ) async {
    print("iiiiii$storelin");
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          print("poi111");
          _logoImage = File(pickedFile.path);
        } else {
          print("4444444 ${storelin}");
          storelin = File(pickedFile.path);
          isPDForCSV = false;
          print("4444444 ${storelin}");
        }
      });
    }
  }

  _getImageFromCamera222(
    bool isLogo,
  ) async {
    print("iiiiii$storelin");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      compressionQuality: 50,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      setState(() {
        if (isLogo) {
          print("poi111");
          _logoImage = File(result!.files.single.path.toString());
        } else {
          print("4444444 ${storelin}");
          storelin = File(result!.files.single.path.toString());
          String? fileExtension = storelin?.path.split('.').last.toLowerCase();
          isPDForCSV = fileExtension == "pdf" || fileExtension == "csv";
          print("4444444 ${storelin}");
        }
      });
    }
  }

  bool isPDForCSV = false;
  final formKey = GlobalKey<FormState>();
  File? forntimage;
  File? storelogo;
  File? storelin;
  var pw;
  String? pp;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign up",
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 60,
              ),
              const Text(
                'Store information',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Ember_Display_Medium'),
              ),
              SizedBox(height: h / 40),
              Row(
                children: [
                  Text(
                    "Type of business",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Ember_Medium",
                        fontWeight: FontWeight.w500),
                  ),
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  // Set this property to true
                  dropdownColor: Colors.white,
                  underline: const SizedBox(),
                  value: Signup_api.selectedBusinessItem!.toString(),
                  items: _dropdownBusinessItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      Signup_api.selectedBusinessItem = newValue!;
                      newValue != "Enterprise"
                          ? Signup_api.businessDisController.clear()
                          : null;
                    });
                  },
                ),
              ),
              SizedBox(height: h / 60),
              Signup_api.selectedBusinessItem == "Enterprise"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Short business description (En)",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Ember_Medium",
                                  fontWeight: FontWeight.w500),
                            ),
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
                          controller: Signup_api.businessDisController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please entre store description";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            // hintText: "Bank Account Number",
                            // labelText: 'Bank Account Number',
                            // labelStyle: const TextStyle(
                            //     color: Colors.black,
                            //     fontSize: 16,
                            //     fontFamily: 'Ember_Display_Medium'),
                          ),
                        ),
                        SizedBox(height: h / 60),
                        Row(
                          children: [
                            Text(
                              "Short business description (Fr)",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Ember_Medium",
                                  fontWeight: FontWeight.w500),
                            ),
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
                          controller: Signup_api.frstoredesController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please entre store description";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            // hintText: "Bank Account Number",
                            // labelText: 'Bank Account Number',
                            // labelStyle: const TextStyle(
                            //     color: Colors.black,
                            //     fontSize: 16,
                            //     fontFamily: 'Ember_Display_Medium'),
                          ),
                        ),
                        SizedBox(height: h / 60),
                      ],
                    )
                  : SizedBox(),
              Row(
                children: [
                  Text(
                    "Store name(En)",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Ember_Medium",
                        fontWeight: FontWeight.w500),
                  ),
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
                controller: Signup_api.storeNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre store name";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  // hintText: "Bank Account Number",
                  // labelText: 'Bank Account Number',
                  // labelStyle: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //     fontFamily: 'Ember_Display_Medium'),
                ),
              ),
              SizedBox(height: h / 60),
              Row(
                children: [
                  Text(
                    "Store name(Fr)",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Ember_Medium",
                        fontWeight: FontWeight.w500),
                  ),
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
                controller: Signup_api.frstoreNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre store name";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  // hintText: "Bank Account Number",
                  // labelText: 'Bank Account Number',
                  // labelStyle: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //     fontFamily: 'Ember_Display_Medium'),
                ),
              ),
              SizedBox(height: h / 60),
              Text(
                "Store address",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ember_Medium",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: h / 100),
              TextFormField(
                controller: Signup_api.storeAddressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre store address";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  // hintText: "Bank Account Number",
                  // labelText: 'Bank Account Number',
                  // labelStyle: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //     fontFamily: 'Ember_Display_Medium'),
                ),
              ),
              SizedBox(height: h / 60),
              Row(
                children: [
                  Text(
                    "Country",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Ember_Medium",
                        fontWeight: FontWeight.w500),
                  ),
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
              Container(
                width: w,
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CountryCodePicker(
                      onChanged: (CountryCode country) {
                        setState(() {
                          _selectedCountry = country;
                        });
                      },
                      initialSelection: 'In',
                      //favorite: ['+1', 'US'],
                    ),
                    Text(
                      _selectedCountry.name.toString(),
                      style: A_style_medium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: h / 60),
              Row(
                children: [
                  Text(
                    "City",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Ember_Medium",
                        fontWeight: FontWeight.w500),
                  ),
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
                onTap: () async {
                  const kGoogleApiKey =
                      "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM";
                  pw = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: kGoogleApiKey,
                    mode: Mode.fullscreen,
                    // Mode.fullscreen
                    language: "BF",
                    hint: "select address",
                  );

                  print("pppppeee");
                  setState(() {
                    Signup_api.cityController.text = pw.description.toString();
                    print('uuuuuu');
                    pp = "${pw.description}".toString();
                  });
                  print("oioi" + pp.runtimeType.toString());
                  print(";;" + pw!.description);
                },
                controller: Signup_api.cityController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre city";
                  } else {
                    return null;
                  }
                },
                readOnly: true,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  // hintText: "Bank Account Number",
                  // labelText: 'Bank Account Number',
                  // labelStyle: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //     fontFamily: 'Ember_Display_Medium'),
                ),
              ),
              SizedBox(height: h / 60),
              Text(
                "Store location",
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
                      child: Signup_api.address.value != "Address not found "
                          ? FittedBox(
                              child: Text(
                                maxLines: 4,
                                "${Signup_api.address.value}",
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
              Row(
                children: [
                  Text(
                    "Do you provide restauration services?",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Ember_Medium",
                        fontWeight: FontWeight.w500),
                  ),
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
              Text(
                "(Restaurant, fast food, bar, pub, café….)",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ember_Medium",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: h / 100),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  // Set this property to true
                  dropdownColor: Colors.white,
                  underline: const SizedBox(),
                  value: Signup_api.selectedResItem,
                  items: _dropdownResItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      Signup_api.selectedResItem = newValue!;
                    });
                    Signup_api.maincategory_list();
                  },
                ),
              ),
              SizedBox(height: h / 60),
              const Text(
                'Working hours',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Ember_Display_Medium'),
              ),
              SizedBox(height: h / 60),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Signup_api.Working_Day.length,
                itemBuilder: (context, index) {
                  print("${Signup_api.Working_Day[index]}");
                  bool qwer = bool.parse(
                      Signup_api.Working_Day[index]['status'].toLowerCase());

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: w / 4.5,
                            child: Text(
                                "${Signup_api.Working_Day[index]['day_name'].toString()}")),
                        FlutterSwitch(
                          width: 48.0,
                          height: 25.0,
                          valueFontSize: 15.0,
                          toggleSize: 15.0,
                          value: qwer,
                          borderRadius: 30.0,
                          padding: 4.0,
                          showOnOff: true,
                          activeColor: logocolo,
                          inactiveColor: Colors.grey,
                          onToggle: (bool value) {
                            setState(() {
                              Signup_api.Working_Day[index]['status'] =
                                  value.toString();
                            });
                          },
                        ),
                        SizedBox(width: w / 70),
                        Signup_api.Working_Day[index]['status'] == "false"
                            ? Text("close")
                            : Text("open"),
                        SizedBox(width: w / 70),
                        GestureDetector(
                          onTap: () {
                            datepicker(index, "open_time", context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)),
                            child: Text(
                                "${Signup_api.Working_Day[index]['open_time']}"),
                          ),
                        ),
                        SizedBox(width: w / 100),
                        Text("-"),
                        SizedBox(width: w / 100),
                        GestureDetector(
                          onTap: () {
                            datepicker(index, "close_time", context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)),
                            child: Text(
                                "${Signup_api.Working_Day[index]['close_time']}"),
                          ),
                        )
                      ],
                    ),
                  );
                },
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
                              _getImageFromCamera(
                                ImageSource.camera,
                                false,
                              );
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
                              _getImageFromCamera(
                                ImageSource.gallery,
                                false,
                              );
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
                    child: storelogo != null
                        ? Image.file(
                            storelogo!,
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
                                    "Upload your store logo",
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
                              _getImageFromCamera1(
                                ImageSource.camera,
                                false,
                              );
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
                                ImageSource.gallery,
                                false,
                              );
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
                    child: forntimage != null
                        ? Image.file(
                            forntimage!,
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
                                    "Upload your front image",
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
                              _getImageFromCamera2(
                                ImageSource.camera,
                                false,
                              );
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
                                ImageSource.gallery,
                                false,
                              );
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text(
                              'Choose File',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Ember_Display_Medium'),
                            ),
                            onTap: () {
                              _getImageFromCamera222(
                                false,
                              );
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
                    height: 140,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        // border: Border.all(color: Colors.black87, width: 0.5)
                        ),
                    child: storelin != null && isPDForCSV
                        ? Column(
                            children: [
                              Image.asset("assets/images/pdfffdownload.png",
                                  scale: 8),
                              SizedBox(
                                height: h / 70,
                              ),
                              Center(child: Text(storelin?.path ?? "")),
                            ],
                          )
                        : storelin != null
                            ? Image.file(
                                storelin!,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        textAlign: TextAlign.center,
                                        "Upload your Store license \n(for enterprise)",
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
              SizedBox(height: h / 40),
              CustomButton(
                  title: 'Continue',
                  onTap: () {
                    print("lat lon $lattt $lonnn");
                    if (Signup_api.address.value == "Address not found ") {
                      Utils().alertbox(' Please select Store location');
                    } else if (storelin == null) {
                      Utils().alertbox(' Please Upload your Store license');
                    } else if (formKey.currentState!.validate()) {
                      Signup_api.Working_Day1.clear();
                      Map<String, String> formattedDay = {};
                      RxList<Map<String, String>> formattedWorkingDay =
                          Signup_api.Working_Day.map((day) {
                        day.forEach((key, value) {
                          formattedDay['"$key"'] = '"$value"';
                          print("$key $value");
                        });
                        Signup_api.Working_Day1.add(formattedDay.toString());
                        print(formattedDay);
                        return formattedDay;
                      }).toList().obs;
                      print("TTT${Signup_api.Working_Day1}");
                      formattedWorkingDay.forEach((day) {});

                      Get.to(() => SignUpThirdScreen(
                            coverid: forntimage != null ? forntimage!.path : "",
                            frontid: widget.frontid,
                            storelogo: storelogo != null ? storelogo!.path : "",
                            storelin: storelin!.path,
                            backid: widget.backid,
                          ));
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
              SizedBox(
                height: h / 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime selectedDateTime = DateTime.now();

  Future<void> showDateTimePicker(index, keyy, BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedTime.hour,
            pickedTime.minute,
          );
          Signup_api.Working_Day[index]['${keyy}'] =
              selectedDateTime.toString();
        });
      }
    }
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  void datepicker(index, keyy, BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      var format1 = DateFormat.Hm();
      setState(() {
        Signup_api.Working_Day[index]['${keyy}'] =
            picked.format(context).toString();
      });
    }
  }
}
