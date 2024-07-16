import 'dart:io';
import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../Api/getprofile.dart';
import '../../../Controllers/constant.dart';
import '../../../Controllers/controller.dart';
import '../../../Controllers/text2.dart';
import '../../../base/custom_button.dart';
import 'modify_profile.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

String? selectedValue;

class _ViewProfileState extends State<ViewProfile> {

  final getprofile = Get.put(driverProfile());
  GetxControllers controller = Get.put(GetxControllers());








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
          title:  Text(
            AppLocalizations.of(context)!.personal_information,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: "Ember"),
          ),
          actions: [

          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child:

            FutureBuilder(future: getprofile.driverrProfile(), builder: (context, snapshot) {
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
                    Text(
                      textAlign: TextAlign.start,
                      AppLocalizations.of(context)!.personal_information,
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
                                AppLocalizations.of(context)!.first_name,
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
                            enabled: false,style: TextStyle(color: Colors.black),
                            readOnly: true,
                            initialValue: getprofile.driveprofilee[0]["data"]["fname"].toString(),
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
                                AppLocalizations.of(context)!.last_name,
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
                            enabled: false,
                            readOnly: true,style: TextStyle(color: Colors.black),
                            initialValue: getprofile.driveprofilee[0]["data"]["lname"].toString(),
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
                                AppLocalizations.of(context)!.date_of_birth,
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
                            enabled: false,
                            readOnly: true,style: TextStyle(color: Colors.black),
                            initialValue: getprofile.driveprofilee[0]["data"]["dob"].toString(),
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
                                AppLocalizations.of(context)!.residence_city,
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
                            enabled: false,
                            readOnly: true,style: TextStyle(color: Colors.black),
                            initialValue: getprofile.driveprofilee[0]["data"]["city"].toString(),
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
                                AppLocalizations.of(context)!.phone_number,
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
                            readOnly: true,
                            initialValue: getprofile.driveprofilee[0]["data"]["phone"].toString(),
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
                              // focusedBorder: OutlineInputBorder(
                              //     borderSide:
                              //     BorderSide(color: Colors.redAccent.shade700, width: 1),
                              //borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(height: h / 70),
                          Text(
                            textAlign: TextAlign.start,
                            AppLocalizations.of(context)!.email,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Ember"),
                          ),
                          SizedBox(height: h / 110),
                          TextFormField(
                            enabled: false,
                            readOnly: true,
                            initialValue: getprofile.driveprofilee[0]["data"]["email"].toString(),
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
                          GestureDetector(
                          // _coverImage
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
                                child:

                                     Image.network(
                                "$image_url${ getprofile.driveprofilee[0]["data"]["frontId_iamge"].toString()}",
                                  fit: BoxFit.cover,
                                )

                                //     : Center(
                                //   child: Column(
                                //     mainAxisAlignment:
                                //     MainAxisAlignment.center,
                                //     children: [
                                //       Icon(
                                //         Icons.cloud_upload_outlined,
                                //         // Replace with your desired icon
                                //         size: h / 12.9,
                                //         color: Colors.grey, // Icon color
                                //       ),
                                //       Row(
                                //         crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //         mainAxisAlignment:
                                //         MainAxisAlignment.center,
                                //         children: [
                                //           Text(
                                //             AppLocalizations.of(context)!.uploadforntsideid,
                                //             style: TextStyle(
                                //                 color: Colors.black,
                                //                 fontSize: 16,
                                //                 fontFamily:
                                //                 'Ember_Display_Medium'),
                                //           ),
                                //           const Text(
                                //             "*",
                                //             style: TextStyle(
                                //                 color: Colors.red,
                                //                 fontSize: 16,
                                //                 fontFamily:
                                //                 'Ember_Display_Medium'),
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                          SizedBox(height: h / 40),
                          GestureDetector(
                           // _coverImage
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
                                child:  Image.network(
                                  "$image_url${ getprofile.driveprofilee[0]["data"]["backId_iamge"].toString()}",
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: h / 40),
                          GestureDetector(
                    // _coverImage
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
                                child:  Image.network(
                                  "$image_url${ getprofile.driveprofilee[0]["data"]["vehical_iamge"].toString()}",
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: h / 40),
                          GestureDetector(

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
                                child: Image.network(
                                  "$image_url${ getprofile.driveprofilee[0]["data"]["document"].toString()}",
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: h / 40),
                          CustomButton(
                              title:  AppLocalizations.of(context)!.modify,
                              onTap: () {
                                Get.to(() => ModifyProfile());

                              }),

                        ],
                      ),
                    ),
                  ],
                )
              :
              Center(child: Text("Loading....",))

              ;
            },)


          ),
        ));
  }
}
