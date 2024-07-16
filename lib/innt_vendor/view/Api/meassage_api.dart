import 'dart:convert';

import 'package:demo_innt/innt_vendor/view/screen/chat_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../users/chat_screenvender.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../models/chatlistt.dart';

class meassage_api extends GetxController {
  RxList<chatlistt> chatlistlist = <chatlistt>[].obs;
  RxList chatlistlisttt = [].obs;
  RxList uservenderchatlist = [].obs;
  RxBool loading = false.obs;
  var imagePath = ''.obs;

  Future<RxList<chatlistt>?> chatlist() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    try{final response = await http.post(
        Uri.parse(Seller_base_url + 'customerChatList'),
        body: {"vendorId": sellerid.toString()});
    var decodedData = json.decode(response.body);
    if (response.statusCode == 200) {
      chatlistlist.clear();
      chatlistlist.add(chatlistt.fromJson(decodedData));
      return chatlistlist;
    }
    else {}
    }
    catch(e){print("jkhkfhv $e");}}

  Future chatlist1() async {

    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    try{ final response = await http.post(
        Uri.parse(Seller_base_url + 'driverChatList'),
        body: {"vendorId": sellerid.toString()});
    var decodedData = json.decode(response.body);
    if (response.statusCode == 200 && decodedData["result"].toString()=="true") {
      chatlistlisttt.clear();
      chatlistlisttt.add(decodedData);
      return chatlistlisttt;
    } else {
    }}catch(e){
      print("jkhkfhvyyy $e");
    }
  }

  Future chatsendlist(userid, text,status) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
        Uri.parse(Seller_base_url + 'venderSend_message'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "venderId": sellerid,
          "text": text,
          "send_status": status.toString(),
          if(status==0)"userId": userid.toString(),
          if(status==4) "driverId": userid
        }));
    print("send ${response.reasonPhrase.toString()}");
    var decodedData = json.decode(response.body);
    print("send ${decodedData}");
    if (response.statusCode == 200 && decodedData["result"] == "true") {
      Utils().sendMassage('${decodedData['message'].toString()}');
    } else {
      Utils().sendMassage('${decodedData['message'].toString()}');
    }
  }

  chatimageapi(userid, text, username, userimage,status) async {
    loading.value = true;
    update();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("text1234567 :${text} ${sellerid}");
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${Seller_base_url}venderSend_message"));
      request.fields.addAll({
        "venderId": sellerid.toString(),
        "send_status": status.toString(),
        if(status==0)"userId": userid.toString(),
        if(status==4) "driverId": userid.toString()
      });

      request.files.add(await http.MultipartFile.fromPath(
        "text",
        text.toString(),
        contentType: MediaType(
          'image',
          'png',
        ),
      ));
      print("kjjjjd");
      http.StreamedResponse response1 = await request.send();
      print(response1.statusCode);
      var responseString = await response1.stream.bytesToString();
      var jsonResponse = json.decode(responseString.toString());
      if (response1.statusCode == 200) {
        print('oo;oi$jsonResponse');
        if (jsonResponse['result'].toString() == "true".toString()) {
          loading.value = false;
          update();
          Get.off(ChatScreen(status: status,
            username: username,
            userid: userid,
            userimage: userimage,
          ));
        }
      } else {
        loading.value = false;
        update();
        Utils().sendMassage("${jsonResponse["message"]}");
        // Utils().alertbox(
        //     '${jsonResponse['msg'].toString()} Please fill all field & all photo');
        print(response1.toString());
      }
    } catch (e) {
      loading.value = false;
      update();
      print("dd" + e.toString());
    }
  }

  Stream<List<dynamic>> uservenderchat(userid,status) async* {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("dattaaa $sellerid $userid $status");
    final response = await http.post(
        Uri.parse(Seller_base_url + 'venderGet_message'),
        body: {
          "venderId": sellerid.toString(),
          if(status==0)"userId": userid.toString(),
          if(status==4)"driverId": userid.toString()
        });
    print("send : ${response.body}");
    var decodedData = json.decode(response.body);
    print("send : $decodedData");
    uservenderchatlist.clear();
    if (response.statusCode == 200) {
      print("message $decodedData");

      uservenderchatlist.add(decodedData);
      yield uservenderchatlist;
    } else {
      // Utils().sendMassage('${decodedData['message'].toString()}');
    }
  }
}
