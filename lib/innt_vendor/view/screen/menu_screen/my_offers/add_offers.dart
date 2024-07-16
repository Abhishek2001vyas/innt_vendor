import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../../../innt_delivery/base/custom_button.dart';
import '../../../../../ulits/utils.dart';
import '../../../Api/offer.dart';
import '../../../Api/productlist_api.dart';

class AddOffers extends StatefulWidget {
  const AddOffers({super.key});

  @override
  State<AddOffers> createState() => _AddOffersState();
}

class _AddOffersState extends State<AddOffers> {
  TextEditingController endDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();

  DateTime? selectedDate;

  Future<void> _showEndDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        // Format the selected date and update the controller's text
        endDateController.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      });
    }
  }

  Future<void> _showStartDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        // Format the selected date and update the controller's text
        startDateController.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      });
    }
  }

  final productlis = Get.put(productlist_api());
  String _selectedItem = 'Store front';
  String? valuedropDownBrandsChoose;
  TextEditingController userlimit = TextEditingController();
  TextEditingController buy = TextEditingController();
  TextEditingController get = TextEditingController();
  TextEditingController prec = TextEditingController();
  final List<String> _dropdownItems = [
    'Store front',
    'Specific product',
  ];
  var isChecked;

  late Future iiu;

  @override
  void initState() {
    // TODO: implement initState
    iiu = productlis.productlistt();
    super.initState();
  }
  final ff = Get.put(Seller_offer_api());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true, title: const Text("Add offer")),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 80,
              ),
              Text(  AppLocalizations.of(context)!.select_directory ,style: smallText),
              SizedBox(
                height: h / 100,
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4.0,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: SizedBox(),
                  //alignment: Alignment.centerRight,
                  value: _selectedItem,
                  items: _dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      // alignment: AlignmentDirectional.,
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              _selectedItem == 'Specific product'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(  AppLocalizations.of(context)!.select_product, style: A_style_medium),
                        SizedBox(
                          height: h / 90,
                        ),
                        FutureBuilder(
                          future: iiu,
                          builder: (context, snapshot) {
                            return productlis.productlisttt.isNotEmpty
                                ? Container(
                                    width: w,
                                    padding: const EdgeInsets.only(
                                      top: 0,
                                      left: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                    ),
                                    child: DropdownButton(
                                      dropdownColor: Colors.white,
                                      underline: const SizedBox(),
                                      // Initial Value
                                      value: valuedropDownBrandsChoose,
                                      hint: Text(
                                        AppLocalizations.of(context)!.select_product,
                                        style: TextStyle(
                                            color: Colors.grey.shade600),
                                      ),
                                      isExpanded: true,
                                      // Down Arrow Icon
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.black),
                                      // Array list of items
                                      items: productlis.productlisttt
                                          .elementAt(0)
                                          .data!
                                          .map((items) {
                                        return DropdownMenuItem(
                                          value: items.productId.toString(),
                                          child: Text(
                                              items.productName.toString(),
                                              style: A_style_medium),
                                        );
                                      }).toList(),
                                      onChanged: (newvalue) {
                                        setState(() {
                                          valuedropDownBrandsChoose = newvalue;
                                        });
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    child: Text("Loading"),
                                  );
                          },
                        ),
                        SizedBox(
                          height: h / 60,
                        ),
                      ],
                    )
                  : SizedBox(),
              Text(  AppLocalizations.of(context)!.offer_type, style: A_style_medium),
              SizedBox(
                height: h / 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    value: isChecked == "1" ? true : false,
                    activeColor: const Color(0xff1455ac),
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = "1";
                      });
                    },
                  ),
                  Text(  AppLocalizations.of(context)!.percentage, style:  TextStyle(
                    //letterSpacing: 1.5,
                    //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: "Amazon_med",
                      fontSize: 14)),
                  Container(
                    padding: const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                    width: w / 1.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: prec,
                      validator: (value) {
                        if (isChecked == "1") {
                          if (value!.isEmpty) {
                            return "please entre";
                          } else {
                            return null;
                          }
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
                        hintText: "${  AppLocalizations.of(context)!.example} 20%",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    value: isChecked == "2" ? true : false,
                    activeColor: const Color(0xff1455ac),
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = "2";
                      });
                    },
                  ),
                  Text( AppLocalizations.of(context)!.buy, style:  TextStyle(
                    //letterSpacing: 1.5,
                    //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: "Amazon_med",
                      fontSize: 14)),
                  Container(
                    padding: const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                    width: w / 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: buy,
                      validator: (value) {
                        if (isChecked == "2") {
                          if (value!.isEmpty) {
                            return "please entre";
                          } else {
                            return null;
                          }
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
                        hintText: "${  AppLocalizations.of(context)!.example}: 1",
                      ),
                    ),
                  ),
                  Text(  AppLocalizations.of(context)!.get, style:  TextStyle(
                    //letterSpacing: 1.5,
                    //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: "Amazon_med",
                      fontSize: 14)),
                  Container(
                    padding: const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                    width: w / 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: get,
                      validator: (value) {
                        if (isChecked == "2") {
                          if (value!.isEmpty) {
                            return "please entre";
                          } else {
                            return null;
                          }
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
                        hintText: "${  AppLocalizations.of(context)!.example} 1",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 60,
              ),
              Text(  AppLocalizations.of(context)!.limit_per_user, style: A_style_medium),
              SizedBox(
                height: h / 90,
              ),
              TextFormField(
                controller: userlimit,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre limit";
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
                  hintText: "${  AppLocalizations.of(context)!.example}: 3",
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.start_date, style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: "Amazon_med",
                          fontSize: 16)),
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
                          controller: startDateController,
                          onTap: () {
                            _showStartDatePicker(context);
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey.shade400,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "mm/dd/yyyy",
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.end_date, style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: "Amazon_med",
                          fontSize: 16)),
                      SizedBox(
                        height: h / 90,
                      ),
                      GestureDetector(
                        onTap: () {
                          //_showDatePicker(context);
                        },
                        child: Container(
                          padding:
                              const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                          width: w / 2.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            controller: endDateController,
                            onTap: () {
                              _showEndDatePicker(context);
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.grey.shade400,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "mm/dd/yyyy",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h / 20,
              ),
              CustomButton(
                title:   AppLocalizations.of(context)!.submit,
                onTap: () {
                  if (isChecked == null) {
                    Utils().sendMassage("Please select offer type");
                  } else if (formKey.currentState!.validate()) {
                    ff.Seller_offer(
                        context,
                        _selectedItem,
                        valuedropDownBrandsChoose,
                        isChecked == "1"
                            ? "Percentage ${prec.text}"
                            : "Buy ${buy.text} Get ${get.text}",
                        endDateController.text.toString(),
                        userlimit.text.toString(),
                        startDateController.text.toString());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }


}


