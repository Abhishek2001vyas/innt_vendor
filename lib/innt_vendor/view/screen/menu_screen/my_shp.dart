import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../ulits/utils.dart';
import '../../Api/shopinfomationapi.dart';
import '../shops/shop_information.dart';

class MyShopScreen extends StatefulWidget {
  const MyShopScreen({super.key});

  @override
  State<MyShopScreen> createState() => _MyShopScreenState();
}

class _MyShopScreenState extends State<MyShopScreen> {
  bool isDarkMode = false;
  bool temporary = false;
  final shopinfo = Get.put(Seller_shopinfo_api());
  TextEditingController amountController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController vacationendDateController = TextEditingController();
  TextEditingController vacationstartDateController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _showEndDatePicker(BuildContext context,no) async {
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
        no==1?
        startDateController.text =
        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}":
        no==2?
        endDateController.text =
        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}":
        no==3?
        vacationstartDateController.text =
        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}":
        vacationendDateController.text =
        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}"


        ;
      });
    }
  }



  late Future _futureData;

  @override
  void initState() {
    // TODO: implement initState
    _futureData =  shopinfo.shopinfo();
    super.initState();
  }

  Future _fetchData() async {
    // Simulate a network call

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
          AppLocalizations.of(context)!.my_shop,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future:_futureData,
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                  children: [
                    Obx(() => shopinfo.Shopinfolist.elementAt(0)
                        .data!
                        .shopImage !=
                        null
                        ? Image.network(
                      "$image_url${shopinfo.Shopinfolist.elementAt(0).data!.shopImage.toString()}",
                      fit: BoxFit.cover,
                      height: h / 5,
                      width: w,
                    )
                        : Container(
                        height: h / 5,
                        width: w,
                        child: Text("No image"))),
                    Container(
                      height: h / 5.5,
                      width: Get.width,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Image.network(
                            "$image_url${shopinfo.Shopinfolist.elementAt(0).data!.sellerImage ?? ""}",
                            height: 50,
                            width: 50,
                            //color: logocolo,
                            fit: BoxFit.fill,
                          )),
                          SizedBox(
                            width: w / 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                    () => Text(
                                    "${shopinfo.Shopinfolist.elementAt(0).data!.shopName ?? ""}",
                                    style: A_style_medium),
                              ),
                              SizedBox(
                                height: h / 80,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.call,
                                    color: logocolo,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Obx(() => Text(
                                    "${shopinfo.Shopinfolist.elementAt(0).data!.sellerMobile ?? ""}",
                                    style: TextStyle(
                                        color: Colors.grey.shade500),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: h / 80,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: logocolo,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Obx(() => SizedBox(
                                    width: w/1.7,
                                    child: Text(
                                      "${shopinfo.Shopinfolist.elementAt(0).data!.shopAddress ?? ""}",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          color: Colors.grey.shade500,
                                          overflow:
                                          TextOverflow.ellipsis),
                                      maxLines: 5,
                                    ),
                                  ))
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ShopInformation());
                            },
                            child: const Icon(
                              Icons.edit,
                              color: logocolo,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: h / 5.6,
                            width: w / 3.3,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 2),
                                ],
                                border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1)),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.local_offer_outlined,
                                  color: logocolo,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(
                                      () => Text(
                                      "${shopinfo.Shopinfolist.elementAt(0).data!.totalProduct}",
                                      style: Text_Bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Products", style: A_style_medium)
                              ],
                            ),
                          ),
                          Container(
                            height: h / 6,
                            width: w / 3.3,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 2),
                                ],
                                border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1)),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.stars_rounded,
                                  color: logocolo,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Text(
                                    "${shopinfo.Shopinfolist.elementAt(0).data!.shopRating}",
                                    style: Text_Bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Ratings", style: A_style_medium)
                              ],
                            ),
                          ),
                          Container(
                            height: h / 6,
                            width: w / 3.3,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 2),
                                ],
                                border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1)),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.medical_services,
                                  color: logocolo,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Text(
                                    "${shopinfo.Shopinfolist.elementAt(0).data!.totalReviews}",
                                    style: Text_Bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Reviews", style: A_style_medium)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: h / 6,
                            width: w / 3.3,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 2),
                                ],
                                border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1)),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  "assets/images/sales.png",
                                  height: 22,
                                  width: 22,
                                  color: logocolo,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Text(
                                    "${shopinfo.Shopinfolist.elementAt(0).data!.totalSales}",
                                    style: Text_Bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Sales", style: A_style_medium)
                              ],
                            ),
                          ),
                          Container(
                            height: h / 6,
                            width: w / 3.3,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 2),
                                ],
                                border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1)),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: logocolo,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Text(
                                    "${shopinfo.Shopinfolist.elementAt(0).data!.pageViews}",
                                    style: Text_Bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Page views", style: A_style_medium)
                              ],
                            ),
                          ),
                          Container(
                            height: h / 6,
                            width: w / 3.3,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 2),
                                ],
                                border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1)),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: logocolo,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Text(
                                    "${shopinfo.Shopinfolist.elementAt(0).data!.totalLikedItems}",
                                    style: Text_Bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("Liked items", style: A_style_medium)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                  ],
                  border: Border.all(color: Colors.grey.shade200, width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                     AppLocalizations.of(context)!.minimum_order_amount,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: w / 1.4,
                        child: NewWidget(amountController: amountController),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(amountController.text.isEmpty){

                            Utils().sendMassage('Please entre amount');

                          }
                          else{
                            shopinfo. minorderamount(amountController.text.toString());
                          }
                        },
                        child: Container(
                          // height: h/12,
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          decoration: BoxDecoration(
                              color: logocolo,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200, blurRadius: 2),
                              ],
                              border: Border.all(
                                  color: Colors.grey.shade200, width: 1)),
                          child:  Text(
                            AppLocalizations.of(context)!.save,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 80,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                        ],
                        border:
                        Border.all(color: Colors.grey.shade200, width: 1)),
                    child: Row(
                      children: [
                         Text(
                           AppLocalizations.of(context)!.temporary_close,
                          style: TextStyle(color: logocolo, fontSize: 20),
                        ),
                        const Spacer(),
                        FlutterSwitch(
                          width: 45.0,
                          height: 25.0,
                          valueFontSize: 15.0,
                          toggleSize: 15.0,
                          value: isDarkMode,
                          borderRadius: 30.0,
                          padding: 4.0,
                          showOnOff: false,
                          activeColor: logocolo,
                          // Set custom colors for light and dark mode
                          inactiveColor: Colors.grey,
                          onToggle: (bool value) {

                            if(startDateController.text.isNotEmpty && endDateController.text.isNotEmpty) {
                              setState(() {
                                isDarkMode = value;
                                // Add code to change the theme mode dynamically here
                                // You can use something like Provider or Get to propagate the value to all parts of the app
                              });
                              shopinfo.temporaryclose(startDateController,endDateController);
                            }
                            else{
                              Utils().sendMassage('please select start & end dates');
                            }

                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "from",
                        style: A_style_mid_black,
                      ),
                      Container(
                        padding:
                        const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: startDateController,
                          onTap: () {
                            _showEndDatePicker(context,1);
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
                              hintText: "Select date",hintStyle: TextStyle(fontSize: 13)
                          ),
                        ),
                      ),
                      Text(
                        "- to",
                        style: A_style_mid_black,
                      ),
                      Container(
                        padding:
                        const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: endDateController,
                          onTap: () {
                            _showEndDatePicker(context,2);
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
                              hintText: "Select date",hintStyle: TextStyle(fontSize: 13)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                        ],
                        border:
                        Border.all(color: Colors.grey.shade200, width: 1)),
                    child: Row(
                      children: [
                         Text(
                           AppLocalizations.of(context)!.vacation_mode,
                          style: TextStyle(color: logocolo, fontSize: 20),
                        ),
                        const Spacer(),
                        FlutterSwitch(
                          width: 45.0,
                          height: 25.0,
                          valueFontSize: 15.0,
                          toggleSize: 15.0,
                          value: temporary,
                          borderRadius: 30.0,
                          padding: 4.0,
                          showOnOff: false,
                          activeColor: logocolo,
                          // Set custom colors for light and dark mode
                          inactiveColor: Colors.grey,
                          onToggle: (bool value) {
                            if(vacationstartDateController.text.isNotEmpty && vacationendDateController.text.isNotEmpty) {
                              setState(() {
                                temporary = value;
                                // Add code to change the theme mode dynamically here
                                // You can use something like Provider or Get to propagate the value to all parts of the app
                              });
                              shopinfo.temporaryclose(vacationstartDateController,vacationendDateController);
                            }
                            else{
                              Utils().sendMassage('please select start & end dates');
                            }

                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From",
                        style: A_style_mid_black,
                      ),
                      Container(
                        padding:
                        const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: vacationstartDateController,
                          onTap: () {
                            _showEndDatePicker(context,3);
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
                            hintText: "Select date",
                          ),
                        ),
                      ),
                      Text(
                        "- to",
                        style: A_style_mid_black,
                      ),
                      Container(
                        padding:
                        const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: vacationendDateController,
                          onTap: () {
                            _showEndDatePicker(context,4);
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
                            hintText: "Select date",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.amountController,
  });

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: amountController,
      /* validator: (value) {
                      if (value!.length < 10) {
                        return "Invalid email address";
                      } else {
                        return null;
                      }
                    },*/
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: logocolo, width: 1),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: logocolo, width: 1),
            borderRadius: BorderRadius.circular(5)),
        border: OutlineInputBorder(
            borderSide:
            const BorderSide(color: logocolo, width: 1),
            borderRadius: BorderRadius.circular(5)),
        hintText: "",
      ),
    );
  }
}
