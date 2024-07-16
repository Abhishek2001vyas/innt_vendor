import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import '../../ulits/constant.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
    required this.destination,
  }) : super(key: key);
  final String destination;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
    _init();
    super.initState();
  }

  _init() async {
    _cameraPosition = const CameraPosition(
      target: LatLng(0, 0), // Example initial lat and lng
      zoom: 15,
    );
    _initLocation();
    getNavigationToDropLocation();
  }

  _initLocation() async {
    Geolocator.getCurrentPosition().then((position) {
      setState(() {
        _currentLocation = position;
      });
    });

    Geolocator.getPositionStream().listen((position) {
      setState(() {
        _currentLocation = position;
      });
      moveToPosition(LatLng(position.latitude, position.longitude));
    });
  }

  moveToPosition(LatLng latLng) async {
    GoogleMapController mapController = await _controller.future;
    getNavigationToDropLocation();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 16,
        ),
      ),
    );
  }

  Future<LatLng> convertAddressToLatLng(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        return LatLng(location.latitude, location.longitude);
      }
    } catch (e) {
      print('Error converting address to coordinates: $e');
    }
    return const LatLng(0, 0); // Default coordinates if conversion fails
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
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
        child: Column(
          children: [
            Container(
              height: h / 2,
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    polylines: Set<Polyline>.of(polylines.values),
                    initialCameraPosition: _cameraPosition!,
                    markers: {
                      if (destinationPosition != null) destinationPosition!,
                    },
                    onMapCreated: (GoogleMapController controller) {
                      if (!_controller.isCompleted) {
                        _controller.complete(controller);
                      }
                    },
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: _getMarker(),
                    ),
                  ),
                  if (_currentLocation == null)
                    const Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                    )),
                  Positioned(
                    bottom: h / 80,
                    right: w / 80,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigation_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            LatLng destinationLatLng =
                                await convertAddressToLatLng(
                                    widget.destination.toString());

                            if (destinationLatLng.latitude != 0 &&
                                destinationLatLng.longitude != 0) {
                              String destinationQuery =
                                  '${destinationLatLng.latitude}, ${destinationLatLng.longitude}';
                              String mapsUrl =
                                  'google.navigation:q=$destinationQuery&key=AIzaSyAibWV0NM3Z51ZB0qIeKfxBBFs3vYZxUuM';

                              await launchUrl(Uri.parse(mapsUrl));
                            } else {
                              Fluttertoast.showToast(msg: "please wait");
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xffe5f0fc),
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: logocolo)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order Status:", style: A_style_medium),
                              const Text(
                                "Delivered",
                                style: TextStyle(
                                    //letterSpacing: 1.5,
                                    //color: Colors.white,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: "Amazon_med",
                                    fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order verification code: ",
                                  style: A_style_medium),
                              const Text(
                                "863092",
                                style: TextStyle(
                                    //letterSpacing: 1.5,
                                    //color: Colors.white,
                                    color: logocolo,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: "Amazon_med",
                                    fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Expected delivery time:",
                                  style: A_style_medium),
                              const Text(
                                "18:42",
                                style: TextStyle(
                                    //letterSpacing: 1.5,
                                    //color: Colors.white,
                                    color: color1,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: "Amazon_med",
                                    fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery time:  ", style: A_style_medium),
                              const Text(
                                "18:35",
                                style: TextStyle(
                                    //letterSpacing: 1.5,
                                    //color: Colors.white,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: "Amazon_med",
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
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 3)
                          ]),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: logocolo),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Digital House", style: A_style_medium),
                              const Text(
                                "Seller",
                                style: TextStyle(
                                    //letterSpacing: 1.5,
                                    //color: Colors.white,
                                    color: logocolo,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: "Amazon_med",
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(4),
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
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Icon(
                              Icons.call,
                              color: Colors.green.shade800,
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
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 3)
                          ]),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Customer", style: Blue_Text_Bold),
                              SizedBox(
                                height: h / 80,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Name : ",
                                    style: A_style_order,
                                  ),
                                  Text(
                                    "Amit Jain",
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
                                    "Address : ",
                                    style: A_style_order,
                                  ),
                                  Text(
                                    "Indore Madhaya",
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
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: Icon(
                                Icons.call,
                                color: Colors.green.shade800,
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
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 3)
                          ]),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order information", style: Blue_Text_Bold),
                              SizedBox(
                                height: h / 80,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Order ID : ",
                                    style: A_style_order,
                                  ),
                                  Text(
                                    "100189",
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
                                    "Order date : ",
                                    style: A_style_order,
                                  ),
                                  Text(
                                    "11 Jan 2024 16:24 PM",
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
                                    "Payment : ",
                                    style: A_style_order,
                                  ),
                                  Text(
                                    "Cash On Delivery",
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
                                    "Products : ",
                                    style: A_style_order,
                                  ),
                                  Text(
                                    "Item 1",
                                    style: A_style_order,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Image.asset(
                              "assets/images/qr-code.png",
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h / 70,
            ),
            Text(
              "Enter the delivery code sent to the customer",
              style: A_style_medium,
            ),
            SizedBox(
              height: h / 50,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: h / 14.8,
                width: w / 1.3,
                child: Pinput(
                    controller: _otpController,
                    onChanged: (value) {
                      setState(() {
                        _isVerifyButtonEnabled = value.length == 4;
                      });
                    },
                    //controller: off,
                    separatorBuilder: (index) => const SizedBox(width: 22),
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    // focusedPinTheme: focusedPinTheme,
                    // submittedPinTheme: submittedPinTheme,
                    showCursor: true,
                    onCompleted: (pin) {
                      setState(() {
                        otp = pin;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: w,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text("Order delivered",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ember")),
                ),
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
          ],
        ),
      ),
    );
  }

  getNavigationToDropLocation() async {
    LatLng dropLatLng = await convertAddressToLatLng(widget.destination);
    destinationPosition = Marker(
      markerId: const MarkerId('destination'),
      position: dropLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    );

    getDirections(dropLatLng);
  }

  getDirections(LatLng dst, {List<LatLng>? oldPolylineCoordinates}) async {
    List<LatLng> polylineCoordinates = [];
    List<dynamic> points = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyAibWV0NM3Z51ZB0qIeKfxBBFs3vYZxUuM', // Replace with your API key
      PointLatLng(_currentLocation!.latitude, _currentLocation!.longitude),
      PointLatLng(dst.latitude, dst.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        points.add({'lat': point.latitude, 'lng': point.longitude});
      });
    } else {
      print(result.errorMessage);
    }

    setState(() {
      polylines.clear();
      addPolyLine(polylineCoordinates);
    });
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 5,
    );
    polylines[id] = polyline;
  }
}
