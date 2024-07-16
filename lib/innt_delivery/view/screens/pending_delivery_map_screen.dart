import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pinput/pinput.dart';

import '../../Api/orderlist.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import '../../ulits/constant.dart';

class PendingDeliveryMapScreen extends StatefulWidget {
  const PendingDeliveryMapScreen({
    Key? key,
    this.destination,
    this.ordeid,
  }) : super(key: key);
  final destination;
  final ordeid;

  @override
  State<PendingDeliveryMapScreen> createState() =>
      _PendingDeliveryMapScreenState();
}

class _PendingDeliveryMapScreenState extends State<PendingDeliveryMapScreen> {
  TextEditingController _otpController = TextEditingController();
  bool _isVerifyButtonEnabled = false;
  final Completer<GoogleMapController> _controller = Completer();
  CameraPosition? _cameraPosition;
  Position? _currentLocation;
  Position? _currentLocationNew;
  Map<PolylineId, Polyline> polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  Marker? destinationPosition;
  String otp = '';
  final defaultPinTheme = PinTheme(
    margin: EdgeInsets.only(right: 2),
    width: 65,
    height: 65,
    textStyle: TextStyle(
        fontSize: 20, color: Color(0xff1455ac), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade200, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  @override
  void initState() {
    //   _init();
    geoclocation();
    super.initState();
  }

  final orderlist = Get.put(orderapi());
  List<LatLng> polylineCoordinates = [];

  var googleAPiKey = "AIzaSyDg64HvMk1LYbkHcnBMzndPu4EuHRjefAQ";

  Future _createPolylines(lat, lon) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();
    print("ffffgopsdgoj");
    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey, // Google Maps API Key
      PointLatLng(position.latitude, position.longitude),
      PointLatLng(double.parse(lat.toString()), double.parse(lon.toString())),
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('2');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      jointType: JointType.round,
      geodesic: true,
      visible: true,
      color: logocolo,
      points: polylineCoordinates,
      width: 5,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
    print('dosidjhgoihg ${polyline.points}');
  }

  late Position position;
  late CameraPosition _kGooglePlex;

  void geoclocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // await   _createPolylines();
    setState(() {
      _kGooglePlex = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        // appBar: AppBar(
        //   forceMaterialTransparency: true,
        //   backgroundColor: Colors.white,
        //   title: const Text(
        //     "Google Map",
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 20,
        //     ),
        //   ),
        // ),
        body: SingleChildScrollView(
      child: FutureBuilder(
          future: orderlist.acceptdeatils(widget.ordeid),
          builder: (context, snapshot) {
            return
                // snapshot.connectionState==ConnectionState.waiting?
                // Center(child: CircularProgressIndicator(color: logocolo),)
                //     :
                snapshot.hasError
                    ? Center(
                        child: Text("No data"),
                      )
                    : Obx(() {
                        var dataa;
                        late var list;
                        if (orderlist.acceptdeatilss.isNotEmpty) {
                          dataa = orderlist.acceptdeatilss[0]['data'];
                          print("fffffsdssd  ${dataa["lat"]},${dataa["lon"]}");

                          _createPolylines(dataa["lat"], dataa["lon"]);
                          Future.delayed(Duration(seconds: 2));
                          list = {
                            // List of Markers Added on Google Map
                            Marker(
                                markerId: MarkerId('1'),
                                position: LatLng(dataa["lat"], dataa["lon"]),
                                infoWindow: InfoWindow(
                                  title: '${dataa['userFname']}',
                                ))
                          };
                          print("lijfijg");
                        }

                        return orderlist.acceptdeatilss.isNotEmpty
                            ? Column(
                                children: [
                                  Container(
                                    height: h / 2,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: h / 2,
                                          width: w,
                                          child: GoogleMap(
                                            zoomGesturesEnabled: true,
                                            mapType: MapType.terrain,
                                            // trafficEnabled: true,
                                            polylines: Set<Polyline>.of(
                                                polylines.values),
                                            initialCameraPosition: _kGooglePlex,
                                            // mapType: MapType.normal,
                                            // on below line setting user location enabled.
                                            markers: list,
                                            myLocationEnabled: true,
                                            // on below line setting compass enabled.
                                            compassEnabled: true,
                                            onMapCreated: (GoogleMapController
                                                controller) {
                                              _controller.complete(controller);
                                            },
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Color(0xffe5f0fc),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                border: Border.all(
                                                    color: logocolo)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("${  AppLocalizations.of(context)!.orderstatus}:",
                                                        style: A_style_medium),
                                                    const Text(
                                                      "Pending delivery",
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          color: Colors.black,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //   children: [
                                                //     Text("Order verification code: ", style: A_style_medium),
                                                //     const Text(
                                                //       "863092",
                                                //       style: TextStyle(
                                                //         //letterSpacing: 1.5,
                                                //         //color: Colors.white,
                                                //           color: logocolo,
                                                //           overflow: TextOverflow.ellipsis,
                                                //           fontFamily: "Amazon_med",
                                                //           fontSize: 16),
                                                //     )
                                                //   ],
                                                // ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "${  AppLocalizations.of(context)!.expected_delivery_time}:",
                                                        style: A_style_medium),
                                                    Text(
                                                      dataa["expected_time"],
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          color: color1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: h / 70,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 3)
                                                ]),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: logocolo),
                                                  ),
                                                  child: Image.asset(
                                                    "assets/images/user.png",
                                                    height: 40,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w / 90,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(dataa["shopName"],
                                                        style: A_style_medium),
                                                    const Text(
                                                      "Seller",
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          color: logocolo,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                      )),
                                                  child: const Icon(
                                                    Icons.message,
                                                    color: logocolo,
                                                    size: 18,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w / 100,
                                                ),
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                      )),
                                                  child: Icon(
                                                    Icons.call,
                                                    color:
                                                        Colors.green.shade800,
                                                    size: 18,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: h / 70,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 3)
                                                ]),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(  AppLocalizations.of(context)!.customer,
                                                        style: Blue_Text_Bold),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${  AppLocalizations.of(context)!.name} : ",
                                                          style: A_style_order,
                                                        ),
                                                        Text(
                                                          "${dataa["userFname"]} ${dataa["userlname"]}",
                                                          style: A_style_order,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${  AppLocalizations.of(context)!.address} : ",
                                                          style: A_style_order,
                                                        ),
                                                        Text(
                                                          "${dataa["building_no"] ?? ""} ${dataa["village_name"] ?? ""}",
                                                          style: A_style_order,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                  ],
                                                ),
                                                Positioned(
                                                  right: 1,
                                                  top: 1,
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.all(4),
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                        color: whiteColor,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                        )),
                                                    child: Icon(
                                                      Icons.call,
                                                      color:
                                                          Colors.green.shade800,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: h / 70,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 3)
                                                ]),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(  AppLocalizations.of(context)!.order_information,
                                                        style: Blue_Text_Bold),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${  AppLocalizations.of(context)!.order_id} : ",
                                                          style: A_style_order,
                                                        ),
                                                        Text(
                                                          "${dataa["orderId"]}",
                                                          style: A_style_order,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${  AppLocalizations.of(context)!.payment} : ",
                                                          style: A_style_order,
                                                        ),
                                                        Text(
                                                          '${dataa["paymentMethos"]}',
                                                          style: A_style_medium,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${  AppLocalizations.of(context)!.products} : ",
                                                          style: A_style_order,
                                                        ),
                                                        Text(
                                                          "${dataa["products"].length}",
                                                          style: A_style_order,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                // Positioned(
                                                //   bottom: 2,
                                                //   right: 2,
                                                //   child: Image.asset(
                                                //     "assets/images/qr-code.png",
                                                //     height: 70,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h / 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: InkWell(
                                      onTap: () {
                                        orderlist.deliverotp(
                                            dataa['_id'],
                                            dataa["user_mobile"],
                                            context,
                                            h,
                                            w);
                                        //  _showpinfilled(context,h,w);
                                        // _showAnimatedPopup(context);
                                      },
                                      child: Container(
                                        width: w,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade900,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(  AppLocalizations.of(context)!.orderdeliver,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Ember")),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h / 50,
                                  ),
                                ],
                              )
                            : Center(child: Text('No order'));
                      });
          }),
    ));
  }
}
