import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:demo_innt/innt_vendor/view/screen/bottom_navigationbar.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/qr_codes/qrcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../Api/createqrapi.dart';
import 'create_qr_code.dart';

class QRCodesScreen extends StatefulWidget {
  const QRCodesScreen({super.key});

  @override
  State<QRCodesScreen> createState() => _QRCodesScreenState();
}

class _QRCodesScreenState extends State<QRCodesScreen> {
  final qrapi = Get.put(QR_api());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            currentTab = 0;
            Get.offAll(DashboardScreenVendor());
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(AppLocalizations.of(context)!.qr_codes),
        actions: [
          IconButton(
              onPressed: () async {
                await qrapi.productlistforqr();

                Get.to(() => CreateQRCode());
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: qrapi.qrlistt(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(color: logocolo),
                  )
                : Obx(() => qrapi.qrlist.isEmpty
                    ? Text('No Qr')
                    : Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.5),
                          ),
                          itemCount: qrapi.qrlist[0]["data"].length,
                          itemBuilder: (BuildContext context, int index) {
                            var dataa = qrapi.qrlist[0]["data"][index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => QRCodeScan(
                                      qrcode: dataa["qrcode"],
                                      qrname: dataa["qrcode_name"],
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: w / 5,
                                    child: PrettyQrView.data(
                                      data: '${dataa["qrcode"] ?? "0.0"}',
                                      // decoration:  PrettyQrDecoration(
                                      //   image: PrettyQrDecorationImage(
                                      //     image: AssetImage('assets/images/th-_1_.jpg'),
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h / 50,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Text(
                                      "${dataa["qrcode_name"]}",
                                      style: A_style_medium,
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ));
          },
        ),
      ),
    );
  }
}
