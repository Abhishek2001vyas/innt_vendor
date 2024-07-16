import 'dart:async';

import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Viewmap extends StatefulWidget {
  final name;
  final lat;
  final lon;
  final shopname;

  const Viewmap({super.key, this.name, this.lat, this.lon, this.shopname});

  @override
  State<Viewmap> createState() => _ViewmapState();
}

class _ViewmapState extends State<Viewmap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting
// two points
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    geoclocation();

    // _marker.addAll(_list);
  }

  late Position position;

  void geoclocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await _createPolylines();
    setState(() {
      _kGooglePlex = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14,
      );
    });
  }

  _createPolylines() async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey, // Google Maps API Key
      PointLatLng(position.latitude, position.longitude),
      PointLatLng(widget.lat, widget.lon),
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('poly');

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
  }

  late CameraPosition _kGooglePlex;

  late var resulte;
  var googleAPiKey = "AIzaSyDg64HvMk1LYbkHcnBMzndPu4EuHRjefAQ";

// void polyline()async{
//    resulte = await PolylinePoints().getRouteWithAlternatives(
//        request: PolylineRequest(apiKey: "AIzaSyDg64HvMk1LYbkHcnBMzndPu4EuHRjefAQ",
//        origin: PointLatLng(position.latitude, position.longitude),
//            destination:  PointLatLng(widget.lat, widget.lon), mode: TravelMode.driving,
//
//            avoidHighways: false,
//            avoidTolls: false,
//            avoidFerries: false,
//            optimizeWaypoints: false,
//            alternatives: true, wayPoints: []));
// }
  late var list = {
    // List of Markers Added on Google Map
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(widget.lat, widget.lon),
        infoWindow: InfoWindow(
          title: '${widget.shopname}',
        ))
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.name}"),
      ),
      body:
      GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        polylines: Set<Polyline>.of(polylines.values),
// {
//           Polyline(
//             points: [
//               LatLng(widget.lat, widget.lon),
//               LatLng(position.latitude,position.longitude)
//             ],
//             polylineId: PolylineId("1"),
//           )
//         },
        myLocationEnabled: true,
        markers: list,
        // polylines: ,
        // on below line setting compass enabled.
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
