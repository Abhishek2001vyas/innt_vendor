import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../view/screens/chat_screendelivery.dart';

class chat_apii extends GetxController {
  RxList chatlistlist = [].obs;
  RxList uservenderchatlist = [].obs;
  RxBool loading = false.obs;
  var imagePath = ''.obs;

  Stream chatlist() async* {
    chatlistlist.clear();
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    final response = await http.post(
        Uri.parse(devilery_base_url + 'driverChatList'),
        body: {"driverId": driverid.toString()});
    var decodedData = json.decode(response.body);
    if (response.statusCode == 200) {
      chatlistlist.add(decodedData);
      yield chatlistlist;
    } else {
      Utils().sendMassage('${decodedData['message'].toString()}');
    }
  }

  Future chatsendlist(userid, text) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    final response =
        await http.post(Uri.parse(devilery_base_url + 'driverSend_message'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              "driverId": driverid,
              "venderId": userid.toString(),
              "text": text,
              "send_status": "1",
            }));
   var decodedData = json.decode(response.body);
   if (response.statusCode == 200 && decodedData["result"] == "true") {
      Utils().sendMassage('${decodedData['message'].toString()}');
    } else {
      Utils().sendMassage('${decodedData['message'].toString()}');
    }
  }

  chatimageapi(userid, text, username, userimage) async {
    loading.value = true;
    update();
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
   try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${devilery_base_url}driverSend_message"));
      request.fields.addAll({
        "driverId": driverid.toString(),
        "send_status": "1",
        "venderId": userid.toString()
      });

      request.files.add(await http.MultipartFile.fromPath(
        "text",
        text.toString(),
        contentType: MediaType(
          'image',
          'png',
        ),
      ));
      http.StreamedResponse response1 = await request.send();
      var responseString = await response1.stream.bytesToString();
      var jsonResponse = json.decode(responseString.toString());
      if (response1.statusCode == 200) {
        if (jsonResponse['result'].toString() == "true".toString()) {
          loading.value = false;
          update();
          Get.off(ChatScreendelivery(
            username: username,
            userid: userid,
            userimage: userimage,
          ));
        }
      } else {
        loading.value = false;
        update();
        Utils().sendMassage("${jsonResponse["message"]}");
       }
    } catch (e) {
      loading.value = false;
      update();
      }
  }

  Stream<List<dynamic>> uservenderchat(userid) async* {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    final response = await http.post(
        Uri.parse(devilery_base_url + 'chatDetails_list'),
        body: {"driverId": driverid.toString(), "venderId": userid.toString()});
    var decodedData = json.decode(response.body);
   uservenderchatlist.clear();
    if (response.statusCode == 200) {

      uservenderchatlist.add(decodedData);
      yield uservenderchatlist;
    } else {
     }
  }
}
