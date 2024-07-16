import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../Api/wallet.dart';


class withdraw extends StatefulWidget {
  const withdraw({super.key});

  @override
  State<withdraw> createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {
  final formKey = GlobalKey<FormState>();
  final wallet =Get.put(Walletvender());
  TextEditingController amount =TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(  AppLocalizations.of(context)!.withdrawal),centerTitle: true,
      ),

      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h / 60,
                ),
                Text(  AppLocalizations.of(context)!.entreamount, style: A_style_medium),
                SizedBox(
                  height: h / 100,
                ),
                TextFormField(
                  controller: amount,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please entre amount";
                    } else {
                      return null;
                    }
                  },

                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  maxLines: null,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Entre amount",
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
                    //   hintText: "Enter description",
                  ),
                ),
                SizedBox(
                  height: h / 1.5,
                ),

                Container(width: w,height: h/15,
                  child: ElevatedButton(
style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(logocolo)),
                      onPressed: ()async{
                      if(  formKey.currentState!.validate()){
                        await wallet. withdrawrequest(amount.text.toString());
                      }
                      else{

                      }

                  },
                      child: Text(  AppLocalizations.of(context)!.done,style: TextStyle(fontSize: 15),)),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
