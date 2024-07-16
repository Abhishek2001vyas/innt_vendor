import 'dart:io';

import 'package:demo_innt/innt_delivery/view/dashboard/dashboard_delivery.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../Controllers/controller.dart';
import '../Controllers/text2.dart';
import '../base/custom_button.dart';

class SignUpScreenDelivery extends StatefulWidget {
  const SignUpScreenDelivery({super.key});

  @override
  State<SignUpScreenDelivery> createState() => _SignUpScreenDeliveryState();
}

String? selectedValue;

class _SignUpScreenDeliveryState extends State<SignUpScreenDelivery> {
  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  GetxControllers controller = Get.put(GetxControllers());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController drivingIdController = TextEditingController();
  TextEditingController govtIdController = TextEditingController();
  DateTime selectedDate = DateTime.now(); // Default date

  DateTime? selectedTime;
  DateTime? selectedTime1;
  DateTime? selectedTime2;
  DateTime? selectedTime3;
  File? _logoImage;
  File? _coverImage;

  var ll = 10;
  late DateTime _selectedDate;
  String _displayDate = '';
  final ImagePicker _picker = ImagePicker();

  // bool isloading = false;
  // bool _isVerifyButtonEnabled = false;
  // void startTimerDialog() {
  //   Timer(Duration(seconds: 2), () {
  //     Get.to(() => DashboardScreen());
  //   });
  // }

  String _selectedBusinessItem = 'innt';
  final List<String> _dropdownBusinessItems = [
    'innt',
    'innt out',
  ];

  String _selectedLiveItem = 'Fashion and Apparel';
  final List<String> _dropdownLiveItems = [
    'Fashion and Apparel',
    'Electronics and gadgets',
    'Home and Kitchen',
    'Beauty and Personal care and Kitchen',
    'Support and health',
  ];

  String _selectedOutItem = 'Food and Beverages';
  final List<String> _dropdownOutItems = [
    'Food and Beverages',
    'Restaurants',
    'Super Markets',
    'Epiceries',
    'Wine shops afterwork',
  ];

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

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _displayDate =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        _dateController.text = _displayDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(
            "Signup",
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: h / 40),
                GetBuilder<GetxControllers>(
                  builder: (GetxControllers controller) {
                    return GestureDetector(
                      onTap: () {
                        controller.getFromGallery();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: controller.imageFile != null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey.shade300,
                                backgroundImage:
                                    FileImage(File(controller.imageFile!.path)))
                            : CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey.shade300,
                                backgroundImage: const NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                    scale: 10),
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(height: h / 40),
                TextFormField(
                  controller: nameController,
                  /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white12,
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
                    hintText: "Name",
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Ember_Display_Medium'),
                  ),
                ),
                SizedBox(height: h / 40),
                TextFormField(
                  controller: emailController,
                  /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white12,
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
                    hintText: "Email",
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Ember_Display_Medium'),
                  ),
                ),
                SizedBox(height: h / 40),
                IntlPhoneField(
                  dropdownDecoration: BoxDecoration(shape: BoxShape.circle),
                  initialCountryCode: "IN",
                  onCountryChanged: (value) {
                    setState(() {
                      ll = value.maxLength;
                    });
                  },
                  controller: mobileController,
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
                      hintText: 'Mobile Number',
                      hintStyle: A_style_mid,
                      //labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10))
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide:
                      //     BorderSide(color: Colors.redAccent.shade700, width: 1),
                      //borderRadius: BorderRadius.circular(10)),
                      ),
                ),
                SizedBox(height: h / 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    value: _selectedBusinessItem,
                    items: _dropdownBusinessItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBusinessItem = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: h / 40),
                _selectedBusinessItem == "innt"
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          // Set this property to true
                          dropdownColor: Colors.white,
                          underline: SizedBox(),
                          value: _selectedLiveItem,
                          items: _dropdownLiveItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLiveItem = newValue!;
                            });
                          },
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
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
                          value: _selectedOutItem,
                          items: _dropdownOutItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOutItem = newValue!;
                            });
                          },
                        ),
                      ),
                SizedBox(height: h / 40),

                /*     Container(
                  height: 35,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: TextButton(
                      onPressed: () {
                        controller.getImage();
                      },
                      child: Text(
                        "Select Image",
                        style: TextStyle(color: Colors.white),
                      )),
                )*/

                TextFormField(
                  controller: insuranceController,
                  /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
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
                    hintText: "Insurance Number",
                    labelText: 'Insurance Number.',
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Ember_Display_Medium'),
                  ),
                ),
                /*      TextFormField(
                  controller: nickNameController,
                  */
                /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                /*
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
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
                    hintText: "Nick Name",
                    labelText: "Nick Name",
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                ),*/
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
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    // Replace with your desired icon
                                    size: h / 12.9,
                                    color: Colors.grey, // Icon color
                                  ),
                                  const Text(
                                    "Insurance Document",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Ember_Display_Medium'),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: h / 40),
                TextFormField(
                  controller: vehicleNumberController,
                  /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(12),
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
                    hintText: "Vehicle Model",
                    labelText: "Vehicle Model",
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Ember_Display_Medium'),
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
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    // Replace with your desired icon
                                    size: h / 12.9,
                                    color: Colors.grey, // Icon color
                                  ),
                                  const Text(
                                    "Vehicle Image",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Ember_Display_Medium'),
                                  ),
                                ],
                              ),
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
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    // Replace with your desired icon
                                    size: h / 12.9,
                                    color: Colors.grey, // Icon color
                                  ),
                                  const Text(
                                    "Driving Licence",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Ember_Display_Medium'),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: h / 40),
                TextFormField(
                  controller: addressController,
                  /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
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
                    hintText: "Address",
                    labelText: "Address",
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Ember_Display_Medium'),
                  ),
                ),
                SizedBox(height: h / 40),
                TextFormField(
                  controller: vehicleNumberController,
                  /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
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
                    hintText: "Vehicle Number",
                    labelText: "Vehicle Number",
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Ember_Display_Medium'),
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
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    // Replace with your desired icon
                                    size: h / 12.9,
                                    color: Colors.grey, // Icon color
                                  ),
                                  const Text(
                                    "Govt. ID",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Ember_Display_Medium'),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: h / 40),
                TextFormField(
                  onTap: () {
                    _showDatePicker();
                  },

                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'\d{0,4}-\d{0,2}-\d{0,2} \d{0,2}:\d{0,2}')),
                  ],
                  controller: _dateController,

                  /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                  //textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
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
                    hintText: "DD-MM-YYYY",
                    labelText: "DD-MM-YYYY",
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Ember_Display_Medium'),
                  ),
                ),
                SizedBox(height: h / 40),
                CustomButton(
                    title: 'Done',
                    onTap: () {
                      Get.to(() => DashboardDelivery());
                      // Get.to(() => OtpScreen());
                    }),
                SizedBox(height: h / 40),
                /*  const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Ember_Light",
                          fontSize: 14),
                    ),
                    Text(" SignIn",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Color(0xff1455ac),
                            fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(height: h / 40),*/
              ],
            ),
          ),
        ));
  }
}
