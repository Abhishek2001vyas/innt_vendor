import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/button.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../ulits/utils.dart';
import '../../Api/Add_product_api.dart';

class AddProductOther extends StatefulWidget {
  const AddProductOther({super.key});

  @override
  State<AddProductOther> createState() => _AddProductOtherState();
}

class _AddProductOtherState extends State<AddProductOther> {
  bool _isLoading = false;

  List<String> tax = [
    "Exclude",
    "Include",
  ];
  final addproduct = Get.put(Seller_product_api());
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    addproduct.returnday.clear();
    addproduct.rettype = null;
    addproduct.note.clear();
    addproduct.warrantyno.clear();
    addproduct.compostion.clear();
    addproduct.sizeselected.clear();
    // addproduct.size.clear();
    addproduct.colorselected.clear();

    controllervideo.dispose();
    super.dispose();
  }

  List<String> DiscountItem = [
    "Money off",
    "Percent off",
  ];
  List<String> stock = [
    "Unit",
    "Percent",
  ];
  List<String> delivery = [
    "Yes",
    "No",
  ];
  var _images = [];

  @override
  void initState() {
    super.initState();

    // Load all images initially
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.add_product,
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.priceandstock,
                style: A_style_medium,
              ),
              SizedBox(
                height: h / 60,
              ),
              Row(
                children: [
                  Text(  AppLocalizations.of(context)!.unit_price, style: A_style_medium),
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
                height: h / 90,
              ),
              TextFormField(
                controller: addproduct.priceController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  helperMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  //   hintText: "Ex: 456565",
                ),
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.tax, style: A_style_medium),
                      SizedBox(
                        height: h / 90,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 0, left: 20, right: 10, bottom: 3),
                        width: w / 2.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          underline: const SizedBox(),
                          // Initial Value
                          value: addproduct.taxname,
                          hint: Text(
                            'Select',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          isExpanded: true,
                          // Down Arrow Icon
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey.shade600),
                          // Array list of items
                          items: tax.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: A_style_medium,
                              ),
                            );
                          }).toList(),
                          onChanged: (newvalue) {
                            setState(() {
                              addproduct.taxname = newvalue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.tax, style: A_style_medium),
                      SizedBox(
                        height: h / 90,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: addproduct.taxController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "entre data";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            helperMaxLines: 3,
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "0",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.discount_type, style: A_style_medium),
                      SizedBox(
                        height: h / 90,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 0, left: 20, right: 10, bottom: 3),
                        width: w / 2.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          underline: const SizedBox(),
                          // Initial Value
                          value: addproduct.valueChooseDiscountType,
                          hint: Text(
                            'Money off',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          isExpanded: true,
                          // Down Arrow Icon
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey.shade600),
                          // Array list of items
                          items: DiscountItem.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: A_style_medium,
                              ),
                            );
                          }).toList(),
                          onChanged: (newvalue) {
                            setState(() {
                              addproduct.valueChooseDiscountType = newvalue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.discount_amount, style: A_style_medium),
                      SizedBox(
                        height: h / 90,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: addproduct.discountcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please entre data";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            helperMaxLines: 3,
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "0",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.stock_quantity, style: A_style_medium),
                      SizedBox(
                        height: h / 90,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: addproduct.Stockquantity,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Invalid data";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            helperMaxLines: 3,
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "0",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.min_order_quantity, style: A_style_medium),
                      SizedBox(
                        height: h / 90,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: addproduct.Minorder,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Invalid data";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            helperMaxLines: 3,
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "0",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h / 60,
              ),
              Text(AppLocalizations.of(context)!.eligible_for_delivery_question,
                  style: A_style_medium),
              SizedBox(
                height: h / 100,
              ),
              Container(
                width: w,
                padding: const EdgeInsets.only(
                    top: 0, left: 20, right: 10, bottom: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  underline: const SizedBox(),
                  // Initial Value
                  value: addproduct.delivery,
                  hint: Text('Select',
                      style: A_style_medium // Set text color to black
                      ),
                  isExpanded: true,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  // Array list of items
                  items: delivery.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items, style: A_style_medium),
                    );
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      addproduct.delivery = newvalue;
                    });
                  },
                ),
              ),
              SizedBox(
                height: h / 13,
              ),
              GestureDetector(
                  onTap: () {
                    //Get.to( ApiIntegrationDemo());
                  },
                  child: Text(AppLocalizations.of(context)!.product_image, style: A_style_medium)),
              SizedBox(
                height: h / 50,
              ),
              GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 22,
                    childAspectRatio: 5 / 5,
                  ),
                  children: [
                    Column(
                      children: [
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
                          },
                          child: Center(
                            child: image1 != null
                                ? Image.file(
                                    File(image1!.path),
                                    height: 90,
                                    width: 100,
                                  )
                                : Image.asset(
                                    "assets/images/Picture2.png",
                                    height: 100,
                                    width: 100,
                                  ),
                          ),
                        ),
                        Text("picture 1")
                      ],
                    ),
                    Column(
                      children: [
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
                                              fontFamily:
                                                  'Ember_Display_Medium'),
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
                                        leading:
                                            const Icon(Icons.photo_library),
                                        title: const Text(
                                          'Choose from Gallery',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily:
                                                  'Ember_Display_Medium'),
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
                            },
                            child: Center(
                              child: image2 != null
                                  ? Image.file(
                                      File(image2!.path),
                                      height: 90,
                                      width: 100,
                                    )
                                  : Image.asset(
                                      "assets/images/Picture2.png",
                                      height: 100,
                                      width: 100,
                                    ),
                            )),
                        Text("picture 2")
                      ],
                    ),
                    Column(
                      children: [
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
                                              fontFamily:
                                                  'Ember_Display_Medium'),
                                        ),
                                        onTap: () {
                                          _getImageFromCamera3(
                                            ImageSource.camera,
                                            false,
                                          );
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading:
                                            const Icon(Icons.photo_library),
                                        title: const Text(
                                          'Choose from Gallery',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily:
                                                  'Ember_Display_Medium'),
                                        ),
                                        onTap: () {
                                          _getImageFromCamera3(
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
                            },
                            child: Center(
                              child: image3 != null
                                  ? Image.file(
                                      File(image3!.path),
                                      height: 90,
                                      width: 100,
                                    )
                                  : Image.asset(
                                      "assets/images/Picture2.png",
                                      height: 100,
                                      width: 100,
                                    ),
                            )),
                        Text("picture 3")
                      ],
                    ),
                    Column(
                      children: [
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
                                              fontFamily:
                                                  'Ember_Display_Medium'),
                                        ),
                                        onTap: () {
                                          _getImageFromCamera4(
                                            ImageSource.camera,
                                            false,
                                          );
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading:
                                            const Icon(Icons.photo_library),
                                        title: const Text(
                                          'Choose from Gallery',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily:
                                                  'Ember_Display_Medium'),
                                        ),
                                        onTap: () {
                                          _getImageFromCamera4(
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
                            },
                            child: Center(
                              child: image4 != null
                                  ? Image.file(
                                      File(image4!.path),
                                      height: 90,
                                      width: 100,
                                    )
                                  : Image.asset(
                                      "assets/images/Picture2.png",
                                      height: 100,
                                      width: 100,
                                    ),
                            )),
                        Text("picture 4")
                      ],
                    ),
                    Column(
                      children: [
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
                                              fontFamily:
                                                  'Ember_Display_Medium'),
                                        ),
                                        onTap: () {
                                          _getImageFromCamera5(
                                              ImageSource.camera,
                                              false,
                                              image5);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading:
                                            const Icon(Icons.photo_library),
                                        title: const Text(
                                          'Choose from Gallery',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily:
                                                  'Ember_Display_Medium'),
                                        ),
                                        onTap: () {
                                          _getImageFromCamera5(
                                              ImageSource.gallery,
                                              false,
                                              image5);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Center(
                              child: image5 != null
                                  ? Image.file(
                                      File(image5!.path),
                                      height: 90,
                                      width: 100,
                                    )
                                  : Image.asset(
                                      "assets/images/Picture2.png",
                                      height: 100,
                                      width: 100,
                                    ),
                            )),
                        Text("picture 5")
                      ],
                    ),
                    Column(
                      children: [
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
                                          'Take a Videos',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily:
                                                  'Ember_Display_Medium'),
                                        ),
                                        onTap: () {
                                          _getImageFromCamera6(
                                              ImageSource.gallery,
                                              false,
                                              image5);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Center(
                              child: image6 != null
                                  ? DottedBorder(
                                      color: Colors.black,
                                      strokeWidth: 1,
                                      child: FutureBuilder(
                                          future: initializeVideoPlayerFuture2,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: logocolo,
                                              )); // Show a loading indicator while the video is initializing
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}'); // Show an error message if initialization fails
                                            } else {
                                              return Container(
                                                height: 100,
                                                width: 100,
                                                child: VideoPlayer(
                                                    controllervideo),
                                              );
                                            }
                                          }))
                                  : Image.asset(
                                      "assets/images/Picture1.png",
                                      height: 100,
                                      width: 100,
                                    ),
                            )),
                        Text("video")
                      ],
                    ),
                  ]),
              SizedBox(
                height: h / 20,
              ),
              Obx(() => addproduct.isloading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      style: buttonPrimary,
                      onPressed: () {
                        int selectedImageCount = 0;
                        if (image1 != null) selectedImageCount++;
                        if (image2 != null) selectedImageCount++;
                        if (image3 != null) selectedImageCount++;
                        if (image4 != null) selectedImageCount++;
                        if (image5 != null) selectedImageCount++;

                        if (image5 == null &&
                            image4 == null &&
                            image3 == null &&
                            image2 == null &&
                            image1 == null) {
                          Utils().sendMassage("Please upload image");
                        } else if (selectedImageCount < 3) {
                          Utils()
                              .sendMassage("Please upload aleat first 3 image");
                        } else if (addproduct.taxname == null ||
                            addproduct.delivery == null ||
                            addproduct.valueChooseDiscountType == null) {
                          Utils().sendMassage("Please  fill all data");
                        } else if (formKey.currentState!.validate()) {
                          //print("image4${image4!.absolute.toString()}");
                          addproduct.Addproduct(
                              image1 != null ? image1!.path.toString() : "",
                              image2 != null ? image2!.path.toString() : "",
                              image3 != null ? image3!.path.toString() : "",
                              image4 != null ? image4!.path.toString() : "",
                              image5 != null ? image5!.path.toString() : "",
                              image6 != null ? image6!.path.toString() : "",
                              context);
                        }
                      },
                      child:  Text(AppLocalizations.of(context)!.done,
                          style: A_style_text_inside_button))),
            ],
          ),
        ),
      ),
    );
  }

  File? image1;
  File? image2;
  File? image3;
  File? image4;
  File? image5;
  File? image6;

  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromCamera6(
      ImageSource source, bool isLogo, File? naa) async {
    print("gggg${image5}");
    final XFile? pickedFile = await _picker.pickVideo(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          image6 = File(pickedFile.path);
        } else {
          image6 = File(pickedFile.path);
          controllervideo = VideoPlayerController.file(File(pickedFile.path));

          initializeVideoPlayerFuture2 =
              controllervideo.initialize().catchError((error) {
            print("Error initializing video player: $error");
          }).then((_) {
            // Once video has been initialized, start playing it
            //controllervideo.setVolume(_muted ? 0 : 1);
            controllervideo.play();
            // controllervideo1.setLooping(true);
            setState(() {});
          });
        }
      });
    }
    print("uytrrrr${image6}");
  }

  // @override
  // void dispose() {
  //   controllervideo.dispose();
  //   super.dispose();
  // }
  Future<void> initializeVideoPlayerFuture2 = Future.value();
  late VideoPlayerController controllervideo;

  Future<void> _getImageFromCamera5(
      ImageSource source, bool isLogo, File? naa) async {
    print("gggg${image5}");
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          image5 = File(pickedFile.path);
        } else {
          image5 = File(pickedFile.path);
        }
      });
    }
    print("uytrrrr${image5}");
  }

  Future<void> _getImageFromCamera4(ImageSource source, bool isLogo) async {
    print("gggg${image4}");
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          image4 = File(pickedFile.path);
        } else {
          image4 = File(pickedFile.path);
        }
      });
    }
    print("uytrrrr${image4}");
  }

  Future<void> _getImageFromCamera3(ImageSource source, bool isLogo) async {
    print("gggg${image3}");
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          image3 = File(pickedFile.path);
        } else {
          image3 = File(pickedFile.path);
        }
      });
    }
    print("uytrrrr${image3}");
  }

  Future<void> _getImageFromCamera2(ImageSource source, bool isLogo) async {
    print("gggg${image2}");
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          image2 = File(pickedFile.path);
        } else {
          image2 = File(pickedFile.path);
        }
      });
    }
    print("uytrrrr${image2}");
  }

  Future<void> _getImageFromCamera1(ImageSource source, bool isLogo) async {
    print("gggg${image1}");
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isLogo) {
          image1 = File(pickedFile.path);
        } else {
          image1 = File(pickedFile.path);
        }
      });
    }
    print("uytrrrr${image1}");
  }
}
