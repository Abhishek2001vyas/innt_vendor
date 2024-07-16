import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:demo_innt/ulits/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter_api/google_places_flutter_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../innt_delivery/base/custom_button.dart';
import '../../Api/shopinfomationapi.dart';
import '../../api_constant/get_vendorprofile_api.dart';
import 'mapshopupdateinfo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class ShopInformation extends StatefulWidget {
  const ShopInformation({super.key});

  @override
  State<ShopInformation> createState() => _ShopInformationState();
}

class _ShopInformationState extends State<ShopInformation> {
  bool isDarkMode = false;
  File? _logoImage;
  File? _coverImage;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  File? forntimage;
  File? storelogo;
  File? storelin;


  _getImageFromCamera(ImageSource source,
      bool isLogo,) async {
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

  _getImageFromCamera1(ImageSource source,
      bool isLogo,) async {
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

  _getImageFromCamera2(ImageSource source,
      bool isLogo,) async {
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
          print("4444444 ${storelin}");
        }
      });
    }
  }

  final getprofilesller = Get.put(Seller_shopinfo_api());
  final getprofilesller1 = Get.put(fetchVendorProfile());
  var pw;
  String? pp;


  @override
  Widget build(BuildContext context) {
    print("ggggbuild ${vendorProfileList[0]['workHours']}");
    getprofilesller.Working_Day.clear();
    //await getprofilesller1.vendorProfile();
    getprofilesller.Working_Day.add(vendorProfileList[0]['workHours']);
    print("rebuild ${getprofilesller.Working_Day}");
    final h = MediaQuery
        .of(context)
        .size
        .height;
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My shop information",
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child:
          Obx(() =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(  AppLocalizations.of(context)!.store_name, style: A_style_medium),
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
                    controller: getprofilesller.storeNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
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
                      Text(  AppLocalizations.of(context)!.store_address, style: A_style_medium),
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
                    controller: getprofilesller.storeAddressController,
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
                      Text(  AppLocalizations.of(context)!.country, style: A_style_medium),
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
                              getprofilesller.selectedCountry1 = country;
                            });
                          },
                          initialSelection: CountryCode.fromDialCode(
                              '${vendorProfileList[0]['country']}')
                              .toString(),
                          // favorite: ['+1', 'US'],
                        ),
                        Text(
                          getprofilesller.selectedCountry1!.name.toString(),
                          style: A_style_medium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h / 60),
                  Row(
                    children: [
                      Text(  AppLocalizations.of(context)!.city, style: A_style_medium),
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
                      const kGoogleApiKey = "AIzaSyBL-NPdBE4Mmcr7l5qaA5GwEs2w-yQcjEM";
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
                        getprofilesller.cityController.text =
                            pw.description.toString();
                        print('uuuuuu');
                        pp = "${pw.description}".toString();
                      });
                      print("oioi" + pp.runtimeType.toString());
                      print(";;" + pw!.description);
                    },
                    controller: getprofilesller.cityController,
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
                  Text(  AppLocalizations.of(context)!.store_location, style: A_style_medium),
                  SizedBox(height: h / 100),
                  GestureDetector(
                    onTap: () async {
                      print(
                          "hsfdhhfkhfkjjhds${vendorProfileList[0]['location']["coordinates"]}");
                      Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high,
                      );

                      double latitude = position.latitude;
                      double longitude = position.longitude;

                      Get.to(() =>
                          MapScreen2(
                            lat: vendorProfileList[0]['location']["coordinates"][1],
                            lon: vendorProfileList[0]['location']["coordinates"][0],
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
                      child: Obx(() =>
                          Center(
                              child: getprofilesller.address.value !=
                                  "Address not found "
                                  ? FittedBox(
                                child: Text(
                                  maxLines: 4,
                                  "${getprofilesller.address.value}",
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
                  Text(  AppLocalizations.of(context)!.working_hours, style: A_style_medium),
                  SizedBox(height: h / 60),
                  getprofilesller.Working_Day.isNotEmpty ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: getprofilesller.Working_Day[0].length,
                    itemBuilder: (context, index) {
                      print("${getprofilesller.Working_Day[0][index]}");

                      bool qwer = bool.parse(
                          getprofilesller.Working_Day[0][index]['status']
                              .toString());

                      return
                        Obx(() =>
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: w / 4.5,
                                      child: Text(
                                          "${getprofilesller
                                              .Working_Day[0][index]['day_name']
                                              .toString()}")),

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
                                      if (getprofilesller.Working_Day != null &&
                                          getprofilesller.Working_Day
                                              .isNotEmpty) {
                                        // Check if Working_Day is not null and not empty
                                        if (index >= 0 && index <
                                            getprofilesller.Working_Day[0]
                                                .length) {
                                          // Check if index is within bounds
                                          getprofilesller
                                              .Working_Day[0][index]['status'] =
                                              value.toString();
                                          setState(() {
                                            // Update the UI
                                          });
                                        }
                                      }

                                      //getprofilesller.Working_Day[0][index]['status'] = value.toString();
                                      //[index]['status'] = value.toString();
                                      //                                 setState(() {
                                      //
                                      //                                 });

                                    },
                                  ),
                                  SizedBox(width: w / 70),
                                  getprofilesller
                                      .Working_Day[0][index]['status'] ==
                                      "false"
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
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          border: Border.all(
                                              color: Colors.black)),
                                      child: Text(
                                          "${getprofilesller
                                              .Working_Day[0][index]['open_time']}"),
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
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          border: Border.all(
                                              color: Colors.black)),
                                      child: Text(
                                          "${getprofilesller
                                              .Working_Day[0][index]['close_time']}"),
                                    ),
                                  )
                                ],
                              ),
                            ));
                    },
                  ) : Text('mo'),

                  SizedBox(height: h / 40),
                  Row(
                    children: [
                      Text(  AppLocalizations.of(context)!.updateyourstorelogo, style: A_style_medium),
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
                              :
                          vendorProfileList[0]['shop_logo'] != null ?
                          Image.network(
                            "$image_url${vendorProfileList[0]['shop_logo']}",
                            fit: BoxFit.fill,
                          ) : Text("No image")),
                    ),
                  ),
                  SizedBox(height: h / 40),
                  Row(
                    children: [
                      Text( AppLocalizations.of(context)!.updateyourfrontimage, style: A_style_medium),
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
                              :
                          vendorProfileList[0]['vender_profile'] != null ?
                          Image.network(
                            "$image_url${vendorProfileList[0]['vender_profile']}",
                            fit: BoxFit.fill,
                          ) : Text("No image")),
                    ),
                  ),
                  SizedBox(height: h / 40),
                  Row(
                    children: [
                      Text("${  AppLocalizations.of(context)!.updateyourstorelicense}\n(for enterprise)",
                          style: A_style_medium),
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
                        child: storelin != null
                            ? Image.file(
                          storelin!,
                          fit: BoxFit.cover,
                        )
                            :
                        vendorProfileList[0]['shop_licence']
                            .toString()
                            .split(".")
                            .last
                            .toLowerCase() == "pdf" ||
                            vendorProfileList[0]['shop_licence']
                                .toString()
                                .split(".")
                                .last
                                .toLowerCase() == "doc" ||
                            vendorProfileList[0]['shop_licence']
                                .toString()
                                .split(".")
                                .last
                                .toLowerCase() == "csv" ?
                        GestureDetector(
                            onTap: () async {
                              // Check if the file extension is supported for direct opening
                              String fileExtension = vendorProfileList[0]['shop_licence']
                                  .toString()
                                  .split(".")
                                  .last
                                  .toLowerCase();
                              if (fileExtension == "pdf" ||
                                  fileExtension == "doc" ||
                                  fileExtension == "csv") {
                                // Open the file using OpenFile if it's a supported format
                                await OpenFile.open(
                                    "$image_url${vendorProfileList[0]['shop_licence']
                                        .toString()}");
                              } else {
                                // Download the file to local storage
                                // You need to implement a method to download the file here
                                // For simplicity, let's assume you have a method named downloadFile
                                // that takes the URL and returns the local file path
                                // String localFilePath = await downloadFile("$image_url${vendorProfileList[0]['shop_licence'].toString()}");
                                //
                                // // Open the downloaded file using OpenFile
                                // await OpenFile.open(localFilePath);
                              }
                            },
                            child: Image.asset(
                              'assets/images/istockphoto-979004592-170667a.png',))

                            : vendorProfileList[0]['shop_licence'] != null ?
                        Image.network(
                          "$image_url${vendorProfileList[0]['shop_licence']
                              .toString()}",
                          fit: BoxFit.fill,
                        ) : Text("No image"),
                      ),
                    ),
                  ),
                  SizedBox(height: h / 40),
                  CustomButton(
                      title:  AppLocalizations.of(context)!.update,
                      onTap: () async {
                        await getprofilesller.vendorshopinfoupdate(
                            storelogo?.path ?? "0",
                            forntimage?.path ?? "0",
                            storelin?.path ?? "0",
                            context);

                        setState(() {}); //  Get.to(() => const SignUpThirdScreen());
                      }),
                ],
              ))

      ),
    );
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  //  ddd()async{
  //    getprofilesller.Working_Day.clear();
  //  //await getprofilesller1.vendorProfile();
  //  getprofilesller.Working_Day.add(vendorProfileList[0]['workHours']);
  // }
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
        getprofilesller.Working_Day[0][index]['${keyy}'] =
            picked.format(context).toString();
      });
    }
  }

}
