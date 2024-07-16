import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../innt_delivery/Controllers/text2.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> with TickerProviderStateMixin {
  bool _isSelected = false;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('Inventory'),
            bottom: TabBar(
              indicatorPadding: EdgeInsets.all(8),
              indicatorColor: logocolo,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Out of Stock",
                  ),
                ),
                Tab(
                  child: Text(
                    "Low Stock",
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.report_problem,
                          color: Colors.redAccent.shade700,
                        ),
                        SizedBox(
                          width: w / 70,
                        ),
                        Text(
                          "Out of Stock",
                          style: TextStyle(
                              //letterSpacing: 1.5,
                              //color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              color: Colors.redAccent.shade700,
                              fontFamily: "Amazon_med",
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h / 50,
                    ),
                    Text(
                      "Since 0 days",
                      style: A_style_mid,
                    ),
                    SizedBox(
                      height: h / 50,
                    ),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _isSelected = true;
                        });
                      },
                      initialValue: "0",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      //  controller: _dateController,

                      /* validator: (value) {
                                        if (value!.length < 10) {
                                          return "Invalid email address";
                                        } else {
                                          return null;
                                        }
                                      },*/
                      //textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: _isSelected
                            ? Icon(
                                Icons.edit,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.edit,
                                color: Colors.redAccent.shade700,
                              ),
                        contentPadding: EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Current Stock",
                        labelText: "Current Stock",
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Ember_Display_Medium'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.report,
                          color: Colors.yellow.shade800,
                        ),
                        SizedBox(
                          width: w / 70,
                        ),
                        Text(
                          "Low Stock",
                          style: TextStyle(
                              //letterSpacing: 1.5,
                              //color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              color: Colors.yellow.shade800,
                              fontFamily: "Amazon_med",
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h / 50,
                    ),
                    Text(
                      "Since 0 days",
                      style: A_style_mid,
                    ),
                    SizedBox(
                      height: h / 50,
                    ),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _isSelected = true;
                        });
                      },
                      initialValue: "05",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      //  controller: _dateController,

                      /* validator: (value) {
                                        if (value!.length < 10) {
                                          return "Invalid email address";
                                        } else {
                                          return null;
                                        }
                                      },*/
                      //textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: _isSelected
                            ? Icon(
                                Icons.arrow_circle_right_rounded,
                                color: logocolo,
                              )
                            : Icon(
                                Icons.arrow_circle_right_rounded,
                                color: logocolo,
                              ),
                        contentPadding: EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Current Stock",
                        labelText: "Current Stock",
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Ember_Display_Medium'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
