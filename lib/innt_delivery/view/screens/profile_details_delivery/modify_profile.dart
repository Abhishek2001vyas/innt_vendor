import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../ulits/constant.dart';
import '../../../Api/getprofile.dart';
import '../../../Controllers/constant.dart';
import '../../../Controllers/controller.dart';
import '../../../Controllers/text2.dart';
import 'modify_profile_otp.dart';

class ModifyProfile extends StatefulWidget {
  const ModifyProfile({super.key});

  @override
  State<ModifyProfile> createState() => _ModifyProfileState();
}

String? selectedValue;

class _ModifyProfileState extends State<ModifyProfile> {
  @override
  void dispose() {

    super.dispose();
  }
  late Future fetchdat;
  final getprofile = Get.put(driverProfile());
  @override
  void initState() {
    // TODO: implement initState
    fetchdat=getprofile.driverrProfile();
    super.initState();
  }
  GetxControllers controller = Get.put(GetxControllers());

 late TextEditingController firstNameController = TextEditingController( text:  getprofile.driveprofilee[0]["data"]["fname"].toString());
late  TextEditingController mobileController = TextEditingController( text:  getprofile.driveprofilee[0]["data"]["phone"].toString());
  late TextEditingController emailController = TextEditingController( text:  getprofile.driveprofilee[0]["data"]["email"]??"");
 late TextEditingController lastNameController = TextEditingController( text:  getprofile.driveprofilee[0]["data"]["lname"]??"");
 late TextEditingController residencyController = TextEditingController( text:  getprofile.driveprofilee[0]["data"]["city"]??"");
 late TextEditingController dobController = TextEditingController(text:  getprofile.driveprofilee[0]["data"]["dob"]??"");

 DateTime selectedDate = DateTime.now(); // Default date

  DateTime? selectedTime;
  DateTime? selectedTime1;
  DateTime? selectedTime2;
  DateTime? selectedTime3;
  File? _logoImage;
  File? _coverImage;
  File? fornyidimage;
  File? backidimage;
  File? vechilimage;
  File? registrationimage;
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
        dobController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
      calculateAge(pickedDate);
    }
  }
  int age = 0;
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
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: logocolo,
          // forceMaterialTransparency: true,
          centerTitle: true,
          title: const Text(
            "Modify personal information",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: "Ember"),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child:

            FutureBuilder(future: fetchdat, builder: (context, snapshot) {
    return
    snapshot.connectionState==ConnectionState.waiting?
    Center(child: CircularProgressIndicator(),)
        :
    getprofile.driveprofilee.isNotEmpty?

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h / 80,
                ),
                const Text(
                  textAlign: TextAlign.start,
                  " Personal information",
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: "Ember"),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: h / 40),
                      Row(
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "First name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            " *",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 110),
                      TextFormField(

                        controller: firstNameController,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white12,
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
                          // hintText: "Name",
                          // labelText: 'Name',
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Ember_Display_Medium'),
                        ),
                      ),
                      SizedBox(height: h / 70),
                      Row(
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "Last name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            " *",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 110),
                      TextFormField(

                        controller: lastNameController,style: TextStyle(color: Colors.black),
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
                          // hintText: "Name",
                          // labelText: 'Name',
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Ember_Display_Medium'),
                        ),
                      ),
                      SizedBox(height: h / 70),
                      Row(
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "Date of birth",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            " *",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 110),
                      TextFormField(
                        readOnly: true,onTap: (){
                        _showDatePicker();
                      },

                        controller: dobController,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white12,
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

                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Ember_Display_Medium'),
                        ),
                      ),
                      SizedBox(height: h / 70),
                      Row(
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "Residence city",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            " *",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 110),
                      TextFormField(

                        controller: residencyController,style: TextStyle(color: Colors.black),
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
                          // hintText: "Name",
                          // labelText: 'Name',
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Ember_Display_Medium'),
                        ),
                      ),
                      SizedBox(height: h / 70),
                      Row(
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "Phone number",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            " *",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 110),
                      IntlPhoneField(
                        dropdownDecoration:
                            BoxDecoration(shape: BoxShape.circle),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff1455ac), width: 1),
                                borderRadius: BorderRadius.circular(10))

                            ),
                      ),
                      SizedBox(height: h / 70),
                      Text(
                        textAlign: TextAlign.start,
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Ember"),
                      ),
                      SizedBox(height: h / 110),
                      TextFormField(

                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white12,
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
                          // hintText: "Name",
                          // labelText: 'Name',
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Ember_Display_Medium'),
                        ),
                      ),
                      SizedBox(height: h / 40),
                      Text(
                        textAlign: TextAlign.start,
                        "Upload front side ID ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Ember"),
                      ),
                      SizedBox(height: h / 110),
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
                                :


                            getprofile.driveprofilee[0]["data"]["frontId_iamge"]!=null?
                            Image.network(
                              "$image_url${ getprofile.driveprofilee[0]["data"]["frontId_iamge"].toString()}",
                              fit: BoxFit.cover,
                            ):
                            Column(
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
                      Text(
                        textAlign: TextAlign.start,
                        "Upload back side ID ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Ember"),
                      ),
                      SizedBox(height: h / 110),
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
                            ):
                            getprofile.driveprofilee[0]["data"]["backId_iamge"]!=null?
                            Image.network(
                              "$image_url${ getprofile.driveprofilee[0]["data"]["backId_iamge"].toString()}",
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
                      Text(
                        textAlign: TextAlign.start,
                        "Upload vehicle image",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Ember"),
                      ),
                      SizedBox(height: h / 110),
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
                            ):
                            getprofile.driveprofilee[0]["data"]["vehical_iamge"]!=null?
                            Image.network(
                              "$image_url${ getprofile.driveprofilee[0]["data"]["vehical_iamge"].toString()}",
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
                      Text(
                        textAlign: TextAlign.start,
                        "Upload vehicle registration document ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Ember"),
                      ),
                      SizedBox(height: h / 110),
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
                            :
              getprofile.driveprofilee[0]["data"]["document"]!=null?
                            Image.network(
                              "$image_url${ getprofile.driveprofilee[0]["data"]["document"].toString()}",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {Get.back();},
                            child: Container(
                              width: w / 2.3,
                              height: 40,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text("Cancel",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Ember")),
                              ),
                            ),
                          ),
Obx(() =>
                          getprofile.loading==true?
                              Center(child: CircularProgressIndicator(),):
                          InkWell(
                            onTap: () {

                              getprofile.updateprofiledriver(
                                  firstNameController.text.toString(),
                                  lastNameController.text.toString(),
                                  dobController.text.toString(),
                                  mobileController.text.toString(),
                                  emailController.text.toString(),
                                  residencyController.text.toString(),
                                 fornyidimage?.path ??"0" ,
                                  backidimage?.path ??"0" ,
                             vechilimage?.path ??"0" ,
                             registrationimage?.path ??"0"
                              );


                             // Get.to(() => ModifyProfileOtp());
                            },
                            child: Container(
                              width: w / 2.3,
                              height: 40,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: logocolo,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text("Update",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Ember")),
                              ),
                            ),
                          ),)
                        ],
                      ),
                      SizedBox(height: h / 40),
                    ],
                  ),
                ),
              ],
            ):Text("Loading");})
          ),
        ));
  }
}
