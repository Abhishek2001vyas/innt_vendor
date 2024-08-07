import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../Api/Seller_signup_api.dart';

var lattt;
var lonnn;

class MapScreen1 extends StatefulWidget {
  final double lat;
  final double lon;

  const MapScreen1({super.key, required this.lat, required this.lon});

  @override
  State<MapScreen1> createState() => _MapScreen1State();
}

class _MapScreen1State extends State<MapScreen1> {
  // Save the address to SharedPreferences
  void saveAddressToSharedPreferences(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('address', address);
  }

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();
  LatLng? showLocation;

  Timer? _debounce;
  var _controller1 = TextEditingController();
  var uuid = Uuid();
  String k = "AIzaSyAibWV0NM3Z51ZB0qIeKfxBBFs3vYZxUuM";
  List<dynamic> _placeList = [];
  String tappedPlace = "";

  String? saveduserid;

  final Signup_api = Get.put(Signupapi());

  @override
  void initState() {
    super.initState();
    showLocation = LatLng(widget.lat, widget.lon);
    print("ppppppp${showLocation}");
    //useSavedLocation();
    //_getTappedPlace();
  }

  Widget _location() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _currentLocation();
          });
        },
        child: Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ClipOval(
            child: Image.asset(
              "assets/images/seller_logo.png",
              fit: BoxFit.fill,
              //color: Colors.grey.shade700,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getLocationFromPlaceName(String placeName) async {
    try {
      List<Location> locations = await locationFromAddress(placeName);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        double latitude = location.latitude;
        double longitude = location.longitude;

        final GoogleMapController controller = await _controller.future;
        await controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(latitude, longitude), zoom: 16)));

        setState(() {
          showLocation = LatLng(latitude, longitude);
        });
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setDouble('latitude', latitude);
        // await prefs.setDouble('longitude', longitude);
        print("kkm;jm${showLocation.toString()}");
        print('Latitudegmapc: $latitude, Longitudegmapc: $longitude');
      } else {
        print('No results found for the provided place name.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                GoogleMap(
                  zoomControlsEnabled: false,

                  buildingsEnabled: true,
                  //myLocationEnabled: true,
                  compassEnabled: true,

                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onCameraMove: (CameraPosition? position) {
                    if (showLocation != position!.target) {
                      print(showLocation.toString() + "cghcfghfg");
                      setState(() {
                        showLocation = position.target;
                      });
                    }
                  },

                  onCameraIdle: () {
                    showBottomSheet();
                  },
                  initialCameraPosition: CameraPosition(
                    target: showLocation!,
                    zoom: 15.0,
                  ),

                  // markers: markers,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _placeList.length,
                  itemBuilder: (context, index) {
                    final place = _placeList[index];

                    return Container(
                      color: Colors.white,
                      child: ListTile(
                          title: InkWell(
                        onTap: () async {
                          final description = place["description"];
                          print('Tapped place..... $description');
                          try {
                            await getLocationFromPlaceName(description);
                            setState(() {
                              tappedPlace = description;
                              //  _setTappedPlace(description);
                              showBottomSheet();
                              _controller1.clear();
                            });

                            // _setTappedPlace(tappedPlace);
                            getLocationFromPlaceName(tappedPlace);
                          } catch (e) {
                            print('Error: $e');
                          }
                        },
                        child: Text(place["description"]),
                      )),
                    );
                  },
                ),
                _controller1.text.toString() != ""
                    ? Text("")
                    : Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: _getMarker(),
                        ),
                      ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: _location(),
                  ),
                ),
              ]),
            ),
            _controller1.text.toString() != ""
                ? Text("")
                : Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${Signup_api.address.value}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            '${Signup_api.address.value}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () async {
                                Get.back();
                                setState(() {});
                                // Get.to(() =>
                                //     AddressDetails(
                                //       lon: widget.lon,
                                //       lat: widget.lat,
                                //     ));
                                // final prefs =
                                //     await SharedPreferences.getInstance();
                                // await prefs.setString(
                                //     "currentAddress", address);
                                //
                                // await prefs.setDouble(
                                //     'latitude', showLocation!.latitude);
                                // await prefs.setDouble(
                                //     'longitude', showLocation!.longitude);
                                //   Get.to(() => AddAddress());
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => AddAddress();));
                                // Add your button click functionality here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: Text('Confirm Location',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          // color: Colors.white,
          //borderRadius: BorderRadius.circular(100),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     offset: Offset(0, 3),
          //     spreadRadius: 4,
          //     blurRadius: 6,
          //   ),
          // ],
          ),
      child: ClipOval(
        child: Image.asset(
          "assets/images/seller_logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Future useSavedLocation() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   double? latitude = prefs.getDouble('latitude');
  //   double? longitude = prefs.getDouble('longitude');
  //
  //   if (latitude != null && longitude != null) {
  //     final GoogleMapController controller = await _controller.future;
  //     controller.animateCamera(CameraUpdate.newCameraPosition(
  //         CameraPosition(target: LatLng(latitude, longitude), zoom: 16)));
  //     setState(() async {
  //       showLocation = LatLng(latitude, longitude);
  //     });
  //   }
  // }

  void showBottomSheet() async {
    if (showLocation != null) {
      List<Placemark> placemarks = await placemarkFromCoordinates(
              showLocation!.latitude, showLocation!.longitude)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            "The connection has timed out, please try again.");
      });

      if (placemarks.isNotEmpty) {
        final Placemark placemark = placemarks.first;
        setState(() {
          lonnn = showLocation!.longitude;
          lattt = showLocation!.latitude;
          // ${placemark.street},
          Signup_api.address.value =
              "${placemark.subLocality}, ${placemark.locality},"
              " ${placemark.administrativeArea}, ${placemark.country}, ${placemark.postalCode}";
          saveAddressToSharedPreferences(
              Signup_api.address.value); // Save the address
        });
      }
      // final GoogleMapController controller = await _controller.future;
      // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      //     target: LatLng(showLocation!.latitude, showLocation!.longitude),
      //     zoom: 15)));
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${Signup_api.address.value}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 35,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () async {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text("Change"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${Signup_api.address.value}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        // Get.to(()=>AddressDetails());

                        //  Get.back();
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => AdmApp(),));
                        // Add your button click functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: logocolo,
                      ),
                      child: Text('Confirm Location'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

      // Automatically close the bottom sheet after 1 second
      Future.delayed(Duration(milliseconds: 1), () {
        Navigator.of(context).pop(); // Close the bottom sheet
      });
    }
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 15)));
  }
}
