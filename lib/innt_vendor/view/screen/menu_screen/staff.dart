import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../Api/staff.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  final  stafff =Get.put(staff());


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
            AppLocalizations.of(context)!.my_staff
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(future: stafff.stafflist(),
          builder: (context, snapshot) {
            return
              snapshot.connectionState ==ConnectionState.waiting?
              Center(child: CircularProgressIndicator(),):
              stafff.stafflistt.isEmpty?
              Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text:
                      'On the mobile, seller should be able to see all information about the employee',
                      style: A_style_medium,
                      children: <InlineSpan>[
                        TextSpan(
                          text:
                          '( ID, generalinformation, contact information, and active status meaning if the employee is online of offline )',
                          style: TextStyle(
                            //letterSpacing: 1.5,
                            //color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              color: customColor,
                              fontFamily: "Amazon_med",
                              fontSize: 16),
                        )
                      ])):
              ListView.builder(
                shrinkWrap: true,
                itemCount: stafff.stafflistt[0]["data"].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.grey,)),
                      leading: CircleAvatar(radius: 25,backgroundImage: NetworkImage("$image_url${stafff.stafflistt[0]["data"][index]["staff_image"]}"),),
                      title: Text("${stafff.stafflistt[0]["data"][index]["fname"]}"),
                      subtitle: Text("${stafff.stafflistt[0]["data"][index]["position"]}"),
                      trailing:
                      stafff.stafflistt[0]["data"][index]["active_status"].toString()=="0"?
                      Text("Offline",style: TextStyle(color: Colors.red),):
                      Text("Online",style: TextStyle(color: Colors.green),)
                      ,
                    ),
                  );


                },);
          },),
      ),
    );
  }
}
