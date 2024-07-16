import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../Api/Add_product_api.dart';

class Addproduct_attributee extends StatefulWidget {
  const Addproduct_attributee({super.key});

  @override
  State<Addproduct_attributee> createState() => _Addproduct_attributeeState();
}

class _Addproduct_attributeeState extends State<Addproduct_attributee> {
  late List<bool> _isExpandedList = List.generate(
      addproduct.addattributelist[0]["data"].length, (index) => false);
  final addproduct = Get.put(Seller_product_api());
  late Future fetchdata;

  @override
  void initState() {
    // TODO: implement initState
    fetchdata = addproduct.attributeapilist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: h / 20,
                width: w,
                child: TextFormField(
                  onTap: () {},
                  readOnly: true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      hintText: "Search in innt out",
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      fillColor: const Color(0xffeef1f5),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(7))),
                ),
              ),
              SizedBox(
                height: h / 50,
              ),
              FutureBuilder(
                future: fetchdata,
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(
                          color: logocolo,
                        ))
                      : snapshot.hasError
                          ? Text(snapshot.error.toString())
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  addproduct.addattributelist[0]["data"].length,
                              itemBuilder: (context, name) {
                                var dataa = addproduct.addattributelist[0]
                                    ["data"][name];
                                return Theme(
                                  data: theme,
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ExpansionTile(
                                      initiallyExpanded: _isExpandedList[name],
                                      iconColor: Colors.black,
                                      collapsedShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      collapsedBackgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      title: Text(
                                        "${dataa["attribute_name"]}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onExpansionChanged: (value) {
                                        setState(() {
                                          _isExpandedList = List.generate(5,
                                              (i) => i == name ? value : false);
                                        });
                                        print("ppp");
                                      },
                                      backgroundColor: Colors.white,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8),
                                          child: ListView.builder(
                                            itemCount: dataa["attribute_values"]
                                                .length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              var dataavalue =
                                                  dataa["attribute_values"]
                                                      [index];
                                              var inn = addproduct
                                                  .selectedattributelist
                                                  .indexWhere((element) =>
                                                      element[
                                                          "attribute_name"] ==
                                                      dataa["attribute_name"]);

                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 0.0),
                                                child: Row(
                                                  children: [
                                                    Checkbox(
                                                      focusColor: logocolo,
                                                      activeColor: logocolo,
                                                      checkColor: Colors.white,
                                                      value: inn == -1
                                                          ? false
                                                          : addproduct
                                                              .selectedattributelist[
                                                                  inn][
                                                                  "attribute_values"]
                                                              .contains(
                                                                  dataavalue),
                                                      //a.contains(dataa)?
                                                      onChanged: (newValue) {
                                                        if (inn != -1 &&
                                                            addproduct
                                                                .selectedattributelist[
                                                                    inn][
                                                                    "attribute_values"]
                                                                .contains(
                                                                    dataavalue)) {
                                                          addproduct
                                                              .selectedattributelist[
                                                                  inn][
                                                                  "attribute_values"]
                                                              .remove(
                                                                  dataavalue);
                                                          if (addproduct
                                                              .selectedattributelist[
                                                                  inn][
                                                                  "attribute_values"]
                                                              .isEmpty) {
                                                            addproduct
                                                                .selectedattributelist
                                                                .removeAt(inn);
                                                          }
                                                        } else if (inn == -1) {
                                                          addproduct
                                                              .selectedattributelist
                                                              .add({
                                                            "attribute_name": dataa[
                                                                "attribute_name"],
                                                            "attribute_values":
                                                                [dataavalue],
                                                          });
                                                        } else {
                                                          addproduct
                                                              .selectedattributelist[
                                                                  inn][
                                                                  "attribute_values"]
                                                              .add(dataavalue);
                                                        }
                                                        setState(() {});
                                                        print(
                                                            "hfikhfi ${addproduct.selectedattributelist}");
                                                        inn = addproduct
                                                            .selectedattributelist
                                                            .indexWhere((element) =>
                                                                element[
                                                                    "attribute_name"] ==
                                                                dataa[
                                                                    "attribute_name"]);
                                                      },
                                                    ),
                                                    Text(
                                                      "${dataavalue}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
