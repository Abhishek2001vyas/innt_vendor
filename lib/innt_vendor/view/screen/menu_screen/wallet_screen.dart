import 'package:demo_innt/innt_vendor/view/screen/menu_screen/withdraw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../Api/wallet.dart';
import '../scan_screen.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}



class _WalletState extends State<Wallet> {
  final wallet =Get.put(Walletvender());


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
            AppLocalizations.of(context)!.wallet
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          FutureBuilder(future: wallet.Walletbalance(), builder: (context, snapshot) {
            return
              snapshot.connectionState ==ConnectionState.waiting  ||  wallet.wallethistroylist.isEmpty?
              Column(
              children: [
                Stack(children: [
                  Column(
                    children: [
                      Container(
                        width: w,
                        height: h / 4,
                        // margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: logocolo,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                padding:
                                EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  // border:
                                  //     Border.all(color: Colors.white, width: 2)
                                ),
                                child:  Text(
                                  AppLocalizations.of(context)!.balance,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ember_Display_Medium",
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h / 60,
                            ),
                            const Text(
                              "\$ 000.00",
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: "Ember_Display_Medium",
                                  fontSize: 27,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 80,
                      ),
                    ],
                  ),
                  Positioned(
                      left: w / 45,right: w / 45,
                      bottom: h / 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: w / 5.5,
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/topup.png",
                                    height: h / 30,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                     AppLocalizations.of(context)!.top_up,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      //letterSpacing: 1.5,
                                      //color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontFamily: "Amazon_med",
                                        fontSize: 12),
                                  )
                                ],
                              )),
                          Container(
                              width: w / 5.5,
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/withdraw.png",
                                    height: h / 30,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                   Text(
                                     AppLocalizations.of(context)!.withdrawal,
                                    maxLines: 1,
                                    style: TextStyle(
                                      //letterSpacing: 1.5,
                                      //color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontFamily: "Amazon_med",
                                        fontSize: 12),
                                  )
                                ],
                              )),

                        ],
                      )),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h / 11,
                      width: w / 2.2,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "\$ 000.00",
                            style: TextStyle(
                              fontFamily: "Ember_Bold",
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.withdrawal,
                            style: TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Ember_Light",
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: h / 11,
                      width: w / 2.2,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "\$ 000.00",
                            style: TextStyle(
                              fontFamily: "Ember_Bold",
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.pending_withdrawal,
                            style: TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Ember_Light",
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
              :
              Column(
                children: [
                  Stack(children: [
                    Column(
                      children: [
                        Container(
                          width: w,
                          height: h / 4,
                          // margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: logocolo,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // border:
                                    //     Border.all(color: Colors.white, width: 2)
                                  ),
                                  child:  Text(
                                    AppLocalizations.of(context)!.balance,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Ember_Display_Medium",
                                        fontSize: 20,
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: h / 60,
                              ),
                               Text(
                                "CFA ${wallet.walletbalancelist[0]["data"]["withdrawable_amount"]}",
                                maxLines: 1,
                                style: TextStyle(
                                    fontFamily: "Ember_Display_Medium",
                                    fontSize: 27,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h / 80,
                        ),
                      ],
                    ),
                    Positioned(
                        left: w / 45,right: w / 45,
                        bottom: h / 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: w / 5.5,
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black)),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/topup.png",
                                      height: h / 30,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                       AppLocalizations.of(context)!.top_up,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        //letterSpacing: 1.5,
                                        //color: Colors.white,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFamily: "Amazon_med",
                                          fontSize: 12),
                                    )
                                  ],
                                )),
                            GestureDetector(
                              onTap: (){
                                Get.to(withdraw());
                              },
                              child: Container(
                                  width: w / 5.5,
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.black)),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/withdraw.png",
                                        height: h / 30,
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                       Text(
                                         AppLocalizations.of(context)!.withdrawal,
                                        maxLines: 1,
                                        style: TextStyle(
                                          //letterSpacing: 1.5,
                                          //color: Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: "Amazon_med",
                                            fontSize: 12),
                                      )
                                    ],
                                  )),
                            ),

                          ],
                        )),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: h / 11,
                        width: w / 2.2,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "CFA ${wallet.walletbalancelist[0]["data"]["withdrawan_amount"]}",
                              style: const TextStyle(
                                fontFamily: "Ember_Bold",
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.withdrawal,
                              style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: "Ember_Light",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: h / 11,
                        width: w / 2.2,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "CFA ${wallet.walletbalancelist[0]["data"]["pending_balance"]}",
                              style: TextStyle(
                                fontFamily: "Ember_Bold",
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.pending_withdrawal,
                              style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: "Ember_Light",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )



            ;
          },),


          SizedBox(
            height: h / 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.transaction_history,
                style: TextStyle(
                    //letterSpacing: 2.5,
                    //color: Colors.white,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                    fontFamily: "Amazon_bold",
                    fontSize: 20),
              ),

            ],
          ),
          SizedBox(
            height: h / 90,
          ),

          FutureBuilder(future: wallet.Wallethistroy(), builder: (context, snapshot) {
            return
              snapshot.connectionState ==ConnectionState.waiting?
            Center(child: CircularProgressIndicator(),):
                  Obx(() =>
                  wallet.wallethistroylist.isEmpty?
                  Text("No Histroy"):

                      ListView.builder(
                        shrinkWrap: true,reverse: true,
                        itemCount:  wallet.wallethistroylist[0]["data"].length,physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var dataa=wallet.wallethistroylist[0]["data"][index];
                        return   Container(
                          // padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey.shade200, blurRadius: 3),
                              ],
                              border: Border.all(color: Colors.grey.shade200, width: 2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Transaction \n ${dataa["_id"]}", style: A_style_medium),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: const Color(0xD7E2F1FF),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child:  Text(
                                        "CFA ${dataa["amount"]}",
                                        style: const TextStyle(
                                          //letterSpacing: 1.5,
                                          //color: Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500,
                                            color: logocolo,
                                            fontFamily: "Amazon_med",
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey.shade300,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("${dataa["createdAt"].toString().substring(0,10)} ${dataa["createdAt"].toString().substring(11,16)}", style: A_style_mid),
                              ),

                              dataa["status"].toString()=="0"?
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: w / 50,
                                    ),
                                    Text(  AppLocalizations.of(context)!.pending,
                                        style: TextStyle(
                                          //letterSpacing: 1.5,
                                          //color: Colors.white,
                                            color: Colors.grey,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: "Amazon_med",
                                            fontSize: 16))
                                  ],
                                ),
                              )
                                  :

                              dataa["status"].toString()=="1"?
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: w / 50,
                                    ),
                                    Text(  AppLocalizations.of(context)!.approved,
                                        style: TextStyle(
                                          //letterSpacing: 1.5,
                                          //color: Colors.white,
                                            color: Colors.green.shade700,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: "Amazon_med",
                                            fontSize: 16))
                                  ],
                                ),
                              )   :

                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cancel,
                                      color: Colors.red.shade800,
                                    ),
                                    SizedBox(
                                      width: w / 80,
                                    ),





                                    Text(  AppLocalizations.of(context)!.denied,
                                        style: TextStyle(
                                          //letterSpacing: 1.5,
                                          //color: Colors.white,
                                            color: Colors.red.shade800,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: "Amazon_med",
                                            fontSize: 16))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },)


                  );



          },),
        ]),
      ),
    );
  }
}


