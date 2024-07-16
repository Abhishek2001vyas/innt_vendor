import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Api/orderlist.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import '../../ulits/constant.dart';
import 'order_cancel_deletion_reason.dart';

class AcceptedOrderMapScreen extends StatefulWidget {
  const AcceptedOrderMapScreen({
    Key? key,
    required this.destination,
    this.orderid,
  }) : super(key: key);
  final String destination;
  final orderid;

  @override
  State<AcceptedOrderMapScreen> createState() => _AcceptedOrderMapScreenState();
}

class _AcceptedOrderMapScreenState extends State<AcceptedOrderMapScreen> {
  TextEditingController _otpController = TextEditingController();
  bool _isVerifyButtonEnabled = false;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
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
    geoclocation();
    geoclocation();
    super.initState();
  }

  late Position position;
  late CameraPosition _kGooglePlex;


  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting
// two points

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
      PointLatLng(lat, lon),
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

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: const ClipOval(
          child: Icon(
        Icons.directions_car,
        color: Colors.black,
      )),
    );
  }

  final orderlist = Get.put(orderapi());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: orderlist.acceptdeatils(widget.orderid),
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

                          _createPolylines(
                              dataa["shop_lat"], dataa["shop_lon"]);
                          Future.delayed(Duration(seconds: 2));
                          list = {
                            // List of Markers Added on Google Map
                            Marker(
                                markerId: MarkerId('1'),
                                position: LatLng(
                                    dataa["shop_lat"], dataa["shop_lon"]),
                                infoWindow: InfoWindow(
                                  title: '${dataa['shopName']}',
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
                                                     Text(
                                                       AppLocalizations.of(context)!.accept,
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "${  AppLocalizations.of(context)!.order_verification_code}: ",
                                                        style: A_style_medium),
                                                    Text(
                                                      "${dataa["order_verification_code"]}",
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          color: logocolo,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
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
                                                     Text(
                                                      AppLocalizations.of(context)!.seller,
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
                                                    Text("${  AppLocalizations.of(context)!.order_information}",
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
                                                          "${  AppLocalizations.of(context)!.orderdate} : ",
                                                          style: A_style_order,
                                                        ),
                                                        Text(
                                                          "${dataa["products"][0]["createdAt"].toString().substring(0, 10)} ${dataa["products"][0]["createdAt"].toString().substring(11, 16)}",
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
                                                //   child: Container(
                                                //     width: w/5,
                                                //     child: PrettyQrView.data(data: "${dataa['orderId']}"),
                                                //   )
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: InkWell(
                                          onTap: () {
                                            showAdaptiveDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  content: Container(
                                                    height: h / 5,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Icon(
                                                          Icons.check,
                                                          color: Colors
                                                              .grey.shade400,
                                                          size: 60,
                                                        ),
                                                        SizedBox(
                                                          height: h / 90,
                                                        ),
                                                        Text(
                                                          'Are you sure you want to cancel this\norder?',
                                                          style: A_style_medium,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            width: w / 4,
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                                color: logocolo,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                            child: Center(
                                                              child:  Text(
                                                                AppLocalizations.of(context)!.no,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        18,
                                                                    fontFamily:
                                                                        "Ember_Bold"),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                           OrderCancelDeletionReason(orderid: dataa["orderId"],id: widget.orderid,),
                                                                ),
                                                              );
                                                            });
                                                          },
                                                          child: Container(
                                                            width: w / 4,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Center(
                                                              child:  Text(
                                                                AppLocalizations.of(context)!.yes,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      "Ember_Bold",
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    )
                                                  ],
                                                );
                                              },
                                            );

                                            // Get.to(const OrderCancelDeletion());
                                          },
                                          child: Container(
                                            width: w / 2.3,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(  AppLocalizations.of(context)!.cancel,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Ember")),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: InkWell(
                                          onTap: () async {
                                            await orderlist
                                                .acceptpickup(dataa["_id"]);
                                            // Get.to(const PendingDeliveryMapScreen(
                                            //   destination: 'indore',
                                            // ));
                                          },
                                          child: Container(
                                            width: w / 2.3,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: logocolo,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(  AppLocalizations.of(context)!.order_picked_up,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Ember")),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h / 50,
                                  ),
                                ],
                              )
                            : Center(child: Text('No order'));
                      });
          },
        ),
      ),
    );
  }

// getNavigationToDropLocation() async {
//   LatLng dropLatLng = await convertAddressToLatLng(widget.destination);
//   destinationPosition = Marker(
//     markerId: const MarkerId('destination'),
//     position: dropLatLng,
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
//   );
//
//   getDirections(dropLatLng);
// }
//
// getDirections(LatLng dst, {List<LatLng>? oldPolylineCoordinates}) async {
//   List<LatLng> polylineCoordinates = [];
//   List<dynamic> points = [];
//   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//     'AIzaSyDg64HvMk1LYbkHcnBMzndPu4EuHRjefAQ', // Replace with your API key
//     PointLatLng(_currentLocation!.latitude, _currentLocation!.longitude),
//     PointLatLng(dst.latitude, dst.longitude),
//     travelMode: TravelMode.driving,
//   );
//
//   if (result.points.isNotEmpty) {
//     result.points.forEach((PointLatLng point) {
//       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       points.add({'lat': point.latitude, 'lng': point.longitude});
//     });
//   } else {
//     print(result.errorMessage);
//   }
//
//   setState(() {
//     polylines.clear();
//     addPolyLine(polylineCoordinates);
//   });
// }
//
// addPolyLine(List<LatLng> polylineCoordinates) {
//   PolylineId id = const PolylineId('poly');
//   Polyline polyline = Polyline(
//     polylineId: id,
//     color: Colors.blue,
//     points: polylineCoordinates,
//     width: 5,
//   );
//   polylines[id] = polyline;
// }
}
