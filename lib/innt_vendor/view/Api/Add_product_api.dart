import 'dart:convert';
import 'dart:math';

import 'package:demo_innt/innt_vendor/view/screen/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../api_constant/get_vendorprofile_api.dart';
import '../models/categorymodel.dart';
import '../models/probrand.dart';
import '../models/prodcolor.dart';
import '../models/prodsize.dart';
import '../models/producttype_list.dart';
import '../models/subcate.dart';
import '../models/subsubcate.dart';
import '../screen/menu_screen/Inntout _ADD_PRODUCT/addPRODUCT_innt_out.dart';
import '../screen/menu_screen/aad_product_list.dart';
import '../screen/menu_screen/product.dart';
import 'maincategory.dart';

class Seller_product_api extends GetxController {
  RxBool isloading = false.obs;
  var newotp = "".obs;
  var subsubcatename = ''.obs;
  RxList searchcat = [].obs;
  var prodweigth = "KG";
  String? valueChooseDuration = "Day(s)";
  bool? isChecked = false;
  bool? isChecked2 = false;
  var brand;
  var producttype;
  var categoriesid;
  var subcategoriesid;
  var subsubcategoriesid;
  String? valueChooseTime = "Minutes";
  String? valueChooseDiscountType;
  String? taxname;
  var delivery;
  var stock;
  var colorselected = [];
  var sizeselected = [];
  int? rettype;

  final maincateapi = Get.put(fetchmaintCategoryList());
  final ppapi = Get.put(fetchVendorProfile());

  // _showAnimatedPopup(context);

  RxList<Categorymodel> cate = <Categorymodel>[].obs;
  RxList<Subcate> subcate1 = <Subcate>[].obs;
  RxList<Subsubcate> subsubcate = <Subsubcate>[].obs;
  RxList<ProducttypeList> prodtype = <ProducttypeList>[].obs;
  RxList<Prodsize> prodsizes = <Prodsize>[].obs;
  RxList<Prodcolor> prodcolors = <Prodcolor>[].obs;
  late RxList<Probrand> prodbrand = <Probrand>[].obs;
  TextEditingController frproductNameController = TextEditingController();
  TextEditingController frproductDesController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDesController = TextEditingController();
  TextEditingController productTypController = TextEditingController();
  TextEditingController generateCodeController = TextEditingController();
  TextEditingController brandnotfound = TextEditingController();
  TextEditingController produweigth = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController compostion = TextEditingController();
  TextEditingController prodpreatime = TextEditingController();
  TextEditingController warrantyno = TextEditingController();
  TextEditingController warrantydur = TextEditingController();
  TextEditingController returnday = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController Minorder = TextEditingController();
  TextEditingController discountcontroller = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController Stockquantity = TextEditingController();

  // RxBool isloading = false.obs;
  RxInt expandedTileIndex = 0.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  Addproduct(image1, image2, image3, image4, image5, image6, context) async {
    loader();

    var taxarry = [
      {"tax_name": "$taxname", "tax_value": "${taxController.text}"}
    ];

    String taaxx = jsonEncode(taxarry);

    var discountarry = [
      {
        "discount_type": "$valueChooseDiscountType",
        "discount_value": "${discountcontroller.text}"
      }
    ];
    String jsonString = jsonEncode(discountarry);
    var returnTypearray = [
      {"type": "${rettype}", "value": "${returnday.text}"}
    ];

    String returnType = jsonEncode(returnTypearray);

    // var productsize = [
    //   {"type": "${rettype}", "value": "${returnday.text}"}
    // ];

    // List productsize=[];
    // for(int i=0;i<=selectedattributelist.length;i++){
    //
    // }
    //
    //
    // String productsizeee = jsonEncode(productsize);

    // var stockarray = [
    //   {
    //     "stock_name": "$stock",
    //     "stock_value": Minorder.text.isEmpty ? "${Minorder.text}" : "0"
    //   }
    // ];

    //String stccck = jsonEncode(stockarray);
    var joinedValues;
    var rtrr = selectedattributelist.map((attribute) {
      joinedValues = attribute["attribute_values"].join(", ");
      return {
        "attribute_name": attribute["attribute_name"],
        "attribute_values": joinedValues
      };
    }).toList();

    print("hgihgkihgiijhoijdsaolijfli ${jsonEncode(rtrr).toString()}");
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${Seller_base_url}addProduct"));
      request.fields.addAll({
        "venderId": sellerid.toString(),
        "categoryId": categoriesid.toString(),
        "subcategoryId": subcategoriesid.toString(),
        "sub_subcategoryId": subsubcategoriesid.toString(),
        "frnz_product_name": frproductNameController.text.toString(),
        "frnz_product_details": frproductDesController.text.toString(),
        // if (sizeselected.isNotEmpty) "size": sizeselected.join(', ').toString(),
        //
        "productType": producttype.toString(),
        "product_name": productNameController.text.toString(),
        "description": productDesController.text.toString(),
        "product_code": generateCodeController.text.toString(),
        "productPreparation_time":
            "${prodpreatime.text.toString()} ${valueChooseTime}",
        "brand_name":
            brand != null ? brand.toString() : brandnotfound.text.toString(),
        "product_weight": "${produweigth.text} $prodweigth".toString(),
        "returnType": returnType.toString(),
        "product_variation": jsonEncode(rtrr).toString(),
        // "productSize": size.text.toString(),
        // if (colorselected.isNotEmpty)
        //   "color": colorselected.join(', ').toString(),
        if (compostion.text.isNotEmpty)
          "product_details": compostion.text.toString(),
        if (warrantyno.text.isNotEmpty)
          "warranty":
              "${warrantyno.text.toString()} ${valueChooseDuration.toString()}",
        if (note.text.isNotEmpty) "note": note.text.toString(),
        "unit_price": priceController.text.toString(),
        "discount": jsonString.toString(),
        "Tax": taaxx.toString(),
        "stock": Stockquantity.text.toString(),
        "minimum_order": Minorder.text.toString(),
        "deliveryType": delivery.toString(),

        /*   "size":mobileNumberController.text.toString(),*/
      });

      if (image1 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image1",
          image1.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp6");
      if (image2 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image2",
          image2.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp5");
      if (image3 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image3",
          image3.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp8");
      print(image4);
      if (image4 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image4",
          image4.toString(),
          contentType: MediaType(
            'image',
            'jpeg',
          ),
        ));
      }
      print("ppp7");
      if (image5 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image5",
          image5.toString(),
          contentType: MediaType(
            'image',
            'jpeg',
          ),
        ));
      }
      print("ppp7");
      if (image6 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "video",
          image6.toString(),
          contentType: MediaType(
            'video',
            'mp4',
          ),
        ));
      }

      print("ppp1");
      http.StreamedResponse response1 = await request.send();
      print("iiii22");
      var responseString = await response1.stream.bytesToString();
      print("iiii555");
      var jsonResponse = json.decode(responseString.toString());
      print(response1.reasonPhrase);
      print("ppp$responseString");
      if (response1.statusCode == 200) {
        print("pooii");
        // var responseString = await response1.stream.bytesToString();

        if (jsonResponse['result'].toString() == "true".toString()) {
          await _showAnimatedPopup(context);
          selectedattributelist.clear();
          Future.delayed(
            Duration(seconds: 5),
            () {
              currentTab = 3;
              Get.off(ProductList());
            },
          );
          //Utils().sendMassage("Signup Successfully");
          isloading.value = false;
          update();

          // Get.offAll(() => SellerSignUpOTP(otp: jsonResponse['data']["otp"],mobile: jsonResponse['data']["mobile_number"],));
          print("signup" + responseString.toString());
        }
      } else {
        isloading.value = false;
        Utils().alertbox('${jsonResponse['message'].toString()}');
        print(response1.stream.toString());
      }
    } catch (e) {
      isloading.value = false;
    }
  }

  _showAnimatedPopup(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40),
                Text("Your product has been successfully",
                    style: A_style_mid_black),
                SizedBox(height: 10),
                Text("listed and is waiting for approval!",
                    style: A_style_mid_black),
                SizedBox(height: 40),
                Image.asset(
                  "assets/images/successfully-unscreen.gif",
                  height: 100,
                  width: 100,
                  color: logocolo,
                ),
                SizedBox(height: 40),
                // Add any other widgets you want in the dialog
              ],
            ),
          ),
        );
      },
    );
  }

  Addproductinnout(
      image1, image2, image3, image4, image5, image6, context) async {
    loader();
    print("dinesh ${categoriesid}");
    var taxarry = [
      {"tax_name": "$taxname", "tax_value": "${taxController.text}"}
    ];

    String taaxx = jsonEncode(taxarry);

    var discountarry = [
      {
        "discount_type": "$valueChooseDiscountType",
        "discount_value": "${discountcontroller.text}"
      }
    ];
    String jsonString = jsonEncode(discountarry);
    var returnTypearray = [
      {"type": "${rettype}", "value": "${returnday.text}"}
    ];

    String returnType = jsonEncode(returnTypearray);
    // var stockarray = [
    //   {
    //     "stock_name": "$stock",
    //     "stock_value": Minorder.text.isEmpty ? "${Minorder.text}" : "0"
    //   }
    // ];
    //
    // String stccck = jsonEncode(stockarray);

    var joinedValues;
    var rtrr = selectedattributelist.map((attribute) {
      joinedValues = attribute["attribute_values"].join(", ");
      return {
        "attribute_name": attribute["attribute_name"],
        "attribute_values": joinedValues
      };
    }).toList();

    print("hgihgkihgiijhoijdsaolijfli ${jsonEncode(rtrr).toString()}");

    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${Seller_base_url}addInntOutProduct"));
      // request.fields.addAll({
      //   "venderId": sellerid.toString(),
      //   "categoryId": categoriesid.toString(),
      //   "productType": producttype.toString(),
      //   "product_name": productNameController.text.toString(),
      //   "description": productDesController.text.toString(),
      //   "product_code": generateCodeController.text.toString(),
      //   "productPreparation_time":
      //       "${prodpreatime.text.toString()} ${valueChooseTime}",
      //   "product_weight": "${produweigth.text} $prodweigth".toString(),
      //   "productSize": size.text.toString(),
      //   "product_details": compostion.text.toString(),
      //   "note": note.text.toString(),
      //   "unit_price": priceController.text.toString(),
      //   "discount": jsonString.toString(),
      //   "Tax": taaxx.toString(),
      //   "stock": stccck.toString(),
      //   "minimum_order": Minorder.text.toString(),
      //   "deliveryType": delivery.toString(),
      //
      //   /*   "size":mobileNumberController.text.toString(),*/
      // });

      request.fields.addAll({
        "venderId": sellerid.toString(),
        "categoryId": categoriesid.toString(),
        "productType": producttype.toString(),
        "frnz_product_name": frproductNameController.text.toString(),
        "product_name": productNameController.text.toString(),
        "description": productDesController.text.toString(),
        "frnz_product_details": frproductDesController.text.toString(),
        "product_code": generateCodeController.text.toString(),
        "productPreparation_time":
            "${prodpreatime.text.toString()} ${valueChooseTime}",
        "product_weight": "${produweigth.text} $prodweigth".toString(),
        "returnType": returnType.toString(),
        "product_variation": jsonEncode(rtrr).toString(),
        if (compostion.text.isNotEmpty)
          "product_details": compostion.text.toString(),
        if (note.text.isNotEmpty) "note": note.text.toString(),
        "unit_price": priceController.text.toString(),
        "discount": jsonString.toString(),
        "Tax": taaxx.toString(),
        "stock": Stockquantity.text.toString(),
        "minimum_order": Minorder.text.toString(),
        "deliveryType": delivery.toString(),
      });

      if (image1 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image1",
          image1.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp6");
      if (image2 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image2",
          image2.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp5");
      if (image3 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image3",
          image3.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp8");
      print(image4);
      if (image4 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image4",
          image4.toString(),
          contentType: MediaType(
            'image',
            'jpeg',
          ),
        ));
      }
      print("ppp7");
      if (image5 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "image5",
          image5.toString(),
          contentType: MediaType(
            'image',
            'jpeg',
          ),
        ));
      }
      print("ppp7");
      if (image6 != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "video",
          image6.toString(),
          contentType: MediaType(
            'video',
            'mp4',
          ),
        ));
      }

      print("ppp1");
      http.StreamedResponse response1 = await request.send();
      print("iiii22");
      var responseString = await response1.stream.bytesToString();
      print("iiii555");
      var jsonResponse = json.decode(responseString.toString());
      print(response1.reasonPhrase);
      print("ppp$responseString");
      if (response1.statusCode == 200) {
        print("pooii");
        // var responseString = await response1.stream.bytesToString();

        if (jsonResponse['result'].toString() == "true".toString()) {
          await _showAnimatedPopup(context);
          selectedattributelist.clear();
          Future.delayed(
            Duration(seconds: 5),
            () => Get.off(ProductList()),
          );

          isloading.value = false;
          update();

          // Get.offAll(() => SellerSignUpOTP(otp: jsonResponse['data']["otp"],mobile: jsonResponse['data']["mobile_number"],));
          print("signup" + responseString.toString());
        }
      } else {
        isloading.value = false;
        Utils().alertbox('${jsonResponse['message'].toString()}');
        print(response1.stream.toString());
      }
    } catch (e) {
      isloading.value = false;
      print('hhfihihh $e');
    }
  }

  Future<ProducttypeList?> producttypelist() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var res = await http.get(
        Uri.parse("${Seller_base_url}productType_list"),
      );
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pp");
        prodtype.clear();
        prodtype.add(ProducttypeList.fromJson(resData));
        print("pp0");
        print("PPpP$prodtype");
        print("Product Type" + resData.toString());

        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }

  Future<Probrand?> productbrandlist(categoryId) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("prodbrand");
    prodbrand.clear();
    brand = null;
    update();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}brand_list"),
          body: {"categoryId": categoryId.toString()});
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pp");

        prodbrand.add(Probrand.fromJson(resData));

        print("pp0pppppio");
        print("prodbrand $prodbrand");
        print(resData.toString());

        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }

  Future<Prodsize?> productsizelist() async {
    await productcolorlist();
    prodsizes.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}sizeList"), body: {
        "subSubcategoryId": subsubcategoriesid.toString()
        //"categoryId": categoriesid.toString()
      });
      var resData = json.decode(res.body);
      print("jdkfojsdjf");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pp");

        prodsizes.add(Prodsize.fromJson(resData));

        print("pp0");
        print("PPpP$prodsizes");
        print(resData.toString());

        // Utils().sendMassage(resData.toString());
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }

  Future<Prodcolor?> productcolorlist() async {
    prodcolors.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}colorList"),
          body: {"categoryId": categoriesid.toString()});
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pp");

        prodcolors.add(Prodcolor.fromJson(resData));

        print("pp0");
        print("PPpP$prodcolors");
        print(resData.toString());
        //Get.to(() => AddProductVariant());
        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }

  generate6DigitAlphanumericCode() {
    const String _chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random _rnd = Random();

    generateCodeController.text = String.fromCharCodes(Iterable.generate(
        6, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Future<Categorymodel?> Categories() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    cate.clear();
    ppapi.vendorProfile();
    await producttypelist();
    // productbrandlist();
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}venderCategory_list"), body: {
        "venderId": sellerid.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pprrr");

        cate.add(Categorymodel.fromJson(resData));

        print("pp0");
        print("PPpP444$cate");
        print("gggffg" + resData.toString());
        print(
            "jjjjjk${maincate[0]},,${maincate1[0]},,,${vendorProfileList[0]["serviceType"].toString()}");

        vendorProfileList[0]["serviceType"].toString() == maincate[0].toString()
            ? Get.to(AddProduct())
            : Get.to(AddProductinnout());
        print("jjhhhhh${cate[0].data![0].categoryEnglishName}");
        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }

  Future<Subcate?> subCategories(cateid) async {
    print("ppp");
    productbrandlist(cateid);
    categoriesid = cateid;
    print("cate $cateid");
    update();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}venderSubcategory_list"), body: {
        "categoryId": cateid.toString(),
      });
      var resData = json.decode(res.body);
      print("OOOOOOO$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pp33");
        subcate1.clear();
        subcate1.add(Subcate.fromJson(resData));

        print("pp0");
        print("PPpP$subcate1");
        print(resData.toString());
        //Get.to(AddProduct());
        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }

  Future<Subsubcate?> subsubCategories(subcateid) async {
    print("ppp");
    productbrandlist(categoriesid);
    subcategoriesid = subcateid;
    print("cate $subcateid");
    update();
    subsubcate.clear();
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}sub_subcategory_list"), body: {
        "subcategoryId": subcateid.toString(),
      });
      var resData = json.decode(res.body);
      print("OOOOOOO$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pp33");

        subsubcate.add(Subsubcate.fromJson(resData));

        print("pp0");
        print("PPpP$subsubcate");
        print(resData.toString());
        //Get.to(AddProduct());
        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }

  RxList addattributelist = [].obs;
  RxList selectedattributelist = [].obs;

  Future attributeapilist() async {
    addattributelist.clear();
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}attributes_list"), body: {
        "categoryId": categoriesid.toString(),
      });
      var resData = json.decode(res.body);
      print("OOOOOOO$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pp33");

        addattributelist.add(resData);

        print("pp0");
        print("PPpP$addattributelist");
        print(resData.toString());
      } else {
        print("addattributelist ${resData['message']}");
        //Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print("addattributelist ${e}");
    }
    return null;
  }
}
