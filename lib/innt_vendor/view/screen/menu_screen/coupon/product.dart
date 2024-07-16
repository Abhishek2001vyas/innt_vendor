/*
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/coupon/specificproduct.dart';
import 'package:flutter/material.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? dropdownValueCoupon;
  bool checkselect = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Add coupon",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 100 / 100,
        width: MediaQuery.of(context).size.width * 100 / 100,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 4 / 100,
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coupon applies to ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 2 / 100,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: MediaQuery.of(context).size.height * 7 / 100,
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValueCoupon,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueCoupon = newValue;
                            });
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: <String>[
                            'Categories',
                            'Product',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 4 / 100,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 55 / 100,
                      width: MediaQuery.of(context).size.width * 100 / 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(

                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width*10/100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    checkselect = !checkselect;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: checkselect == false
                                      ? Colors.grey
                                      : Colors.blue,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*3/100,
                              ),
                              Text("All product")
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*2/100,
                          ),
                          Row(

                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*10/100,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    checkselect = !checkselect;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: checkselect == true
                                      ? Colors.grey
                                      : Colors.blue,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*3/100,
                              ),
                              Text("Select specific product")
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*2/100,),


                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 4 / 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        _onSubmitClicked();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 7 / 100,
                        width: MediaQuery.of(context).size.width * 90 / 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
  void _onSubmitClicked() {
    if (checkselect) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height * 25/ 100,
            width: MediaQuery.of(context).size.width * 90 / 100,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*5/100,
                ),
                Text(
                  "Coupon Created",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*4/100,
                ),
                Container(height: MediaQuery.of(context).size.height*10/100,
                  width: MediaQuery.of(context).size.width*20/100
                  ,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(80)
                  ),
                  child: Icon(
                    Icons.check,size: 55,color: Colors.blue,
                  ),),

                // CircleAvatar(foregroundColor: Colors.blue,
                //   radius: 35,
                //
                //   child: Icon(
                //     Icons.check,size: 55,color: Colors.blue,
                //   ),
                // )
              ],
            ),
          ),

        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SpecificProduct()),
      );
    }
  }
}
*/
