import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyMap());
}

class MyMap extends StatelessWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MymapView(),
    );
  }
}

class MymapView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyMapViewState();
}

class MyMapViewState extends State<MymapView> {
  CameraPosition mylocation = const CameraPosition(target: LatLng(9.965986, 76.302937));
  Completer<GoogleMapController> _controller = Completer();


  late   Position currentPosition;
  String currentAddress = "";

  bool mapCreated = false;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final destinationAddressFocusNode = FocusNode();

  String startAddress = "";
  String destinationAddress = "";
  String? placeDistance;

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  List<LatLng> polyLineCoordinates = [];

  Map<PolylineId, Polyline> polylines = {};
   double startLatitude = 0.0;
  double startLongitude = 0.0;
   double destinationLatitude = 0.0;
   double destinationlongitude = 0.0;

  Widget _textField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required double width,
    required Icon prefixIcon,
    Widget? suffixIcon,
    required Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  /*Future<bool> _calculateDistance() async {
    try {
      List<Location> startPlacemark = await locationFromAddress(startAddress);
      List<Location> destinationPlacemark =
          await locationFromAddress(destinationAddress);

      double startLatitude = startAddress == currentAddress
          ? currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = startAddress == currentAddress
          ? currentPosition.longitude
          : startPlacemark[0].latitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = "($startLatitude, $startLongitude)";
      String destinationCoordinatesString =
          "($destinationLatitude, $destinationLongitude)";

      Marker startmarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
            title: "Start  $startCoordinatesString", snippet: startAddress),
        icon: BitmapDescriptor.defaultMarker,
      );

      Marker destinationmarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
            title: "Start  $destinationCoordinatesString",
            snippet: destinationAddress),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers.add(startmarker);
      markers.add(destinationmarker);

      print("Start Coordinates : ($startLatitude , $startLongitude)");
      print(
          "Destination Coordinates : ($destinationLatitude , $destinationLongitude)");

      double min_y = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double min_x = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double max_y = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double max_x = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = min_y;
      double southWestLongitude = min_x;

      double northEastLatitude = max_y;
      double northEastLongitude = max_x;
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: LatLng(northEastLatitude, northEastLongitude),
              southwest: LatLng(southWestLatitude, southWestLongitude),
            ),
            100.0),
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);
      double totalDistance = 0.0;

      for (int i = 0; i < polyLineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polyLineCoordinates[i].latitude,
          polyLineCoordinates[i].longitude,
          polyLineCoordinates[i + 1].latitude,
          polyLineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        placeDistance = totalDistance.toStringAsFixed(2);
        print("Distance : $placeDistance km");
      });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
*/

   Future<bool> getDistance({required double startLatitude, required double startLongitude, required double endLatitude, required double endLongitude}) async {

    String Url = 'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${startLatitude},${startLongitude}'
        '&origins=${endLatitude},${endLongitude} &  key = ';

    try {
      var response = await http.get(
        Uri.parse(Url),);
      if (response.statusCode == 200) {
        Map<String, dynamic> userdata = json.decode(response.body);
        List<Location> startPlacemark = await locationFromAddress(startAddress);
        List<Location> destinationPlacemark =
        await locationFromAddress(destinationAddress);

        double startLatitude = startAddress == currentAddress
            ? currentPosition.latitude
            : startPlacemark[0].latitude;

        double startLongitude = startAddress == currentAddress
            ? currentPosition.longitude
            : startPlacemark[0].longitude;

        double destinationLatitude = destinationPlacemark[0].latitude;
        double destinationLongitude = destinationPlacemark[0].longitude;

        String startCoordinatesString = "($startLatitude, $startLongitude)";
        String destinationCoordinatesString =
            "($destinationLatitude, $destinationLongitude)";
        await _coordinateDistance(startLatitude,startLongitude,endLatitude,endLongitude);
        await _createPolylines(startLatitude, startLongitude, destinationLatitude,
            destinationlongitude);
        double totalDistance = 0.0;

        for (int i = 0; i < polyLineCoordinates.length - 1; i++) {
          totalDistance += _coordinateDistance(
            polyLineCoordinates[i].latitude,
            polyLineCoordinates[i].longitude,
            polyLineCoordinates[i + 1].latitude,
            polyLineCoordinates[i + 1].longitude,
          );
        }
        Marker startmarker = Marker(
          markerId: MarkerId(startCoordinatesString),
          position: LatLng(startLatitude, startLongitude),
          infoWindow: InfoWindow(
              title: "Start  $startCoordinatesString", snippet: startAddress),
          icon: BitmapDescriptor.defaultMarker,
        );

        Marker destinationmarker = Marker(
          markerId: MarkerId(destinationCoordinatesString),
          position: LatLng(destinationLatitude, destinationLongitude),
          infoWindow: InfoWindow(
              title: "Start  $destinationCoordinatesString",
              snippet: destinationAddress),
          icon: BitmapDescriptor.defaultMarkerWithHue(5),
        );

        markers.add(startmarker);
        markers.add(destinationmarker);

        print("Start Coordinates : ($startLatitude , $startLongitude)");
        print(
            "Destination Coordinates : ($destinationLatitude , $destinationLongitude)");



        setState(() {
          placeDistance = totalDistance.toStringAsFixed(2);
          print("Distance : $placeDistance km");
        });
        return jsonDecode("$userdata");

      } else
        return false;
    }
    catch (e) {
      print(e);
      return false;
    }
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "api key",
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng pointLatLng) {
        polyLineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polyLineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }


  Future<Position> _getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() async {
        currentPosition = position;
        print("Current Position : $currentPosition");
        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
       await _getAddress();
    }).catchError((e) {
      print("error in get address $e");
    });

    return await Geolocator.getCurrentPosition();
  }

   _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = currentAddress;
        startAddress = currentAddress;
      });
    } catch (e) {
      print("error in placemark $e");
    }

  }

  @override
  Future<void> dispose() async {
    final GoogleMapController controller = await _controller.future;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: mylocation,
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                setState(() {
                  mapCreated = true;
                });
              },
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.cyan,
                      child: InkWell(
                        splashColor: Colors.cyanAccent,
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.add),
                        ),
                        onTap: () async {
                          final GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.zoomIn());
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClipOval(
                    child: Material(
                      color: Colors.cyan,
                      child: InkWell(
                        splashColor: Colors.cyanAccent,
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.remove),
                        ),
                        onTap: () async {
                          final GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.zoomOut());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
           SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Places",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          _textField(
                              controller: startAddressController,
                              focusNode: startAddressFocusNode,
                              label: "Start",
                              hint: "Choose starting Point",
                              width: width,
                              prefixIcon: const Icon(Icons.looks_one),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    startAddressController.text =
                                        currentAddress;
                                    startAddress = currentAddress;
                                  },
                                  icon: const Icon(Icons.my_location)),
                              locationCallback: (String value) {
                                setState(() {
                                  startAddress = value;
                                });
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          _textField(
                              controller: destinationAddressController,
                              focusNode: destinationAddressFocusNode,
                              label: "Destination",
                              hint: "Choose Destination",
                              width: width,
                              prefixIcon: const Icon(Icons.looks_two),
                              locationCallback: (String value) {
                                setState(() {
                                  destinationAddress = value;
                                });
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            child: Text(
                              "Distance : $placeDistance km",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: (startAddress != '' &&
                                    destinationAddress != '')
                                ? () async {
                                    startAddressFocusNode.unfocus();
                                    destinationAddressFocusNode.unfocus();
                                    setState(() {
                                      if (markers.isNotEmpty) markers.clear();
                                      if (polylines.isNotEmpty)
                                        polylines.clear();
                                      if (polyLineCoordinates.isNotEmpty)
                                        polyLineCoordinates.clear();
                                      placeDistance = null;
                                    });

                                    getDistance(startLatitude: startLatitude,startLongitude: startLongitude,
                                    endLatitude: destinationLatitude,endLongitude: destinationlongitude)
                                        .then((isCalculated) {
                                          SnackBar(content: Text("Destination address $destinationLatitude,$destinationlongitude"),);
                                      if (isCalculated) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Distance Calculated Successfully'),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Error Calculating Distance'),
                                          ),
                                        );
                                      }
                                    }
                                    );
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Show Route'.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.orange.shade100, // button color
                      child: InkWell(
                        splashColor: Colors.orange, // inkwell color
                        child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () async {
                          final GoogleMapController controller = await _controller.future;
                          controller.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                  currentPosition.latitude,
                                  currentPosition.longitude,
                                ),
                                zoom: 18.0,
                              ),
                            ),
                          );
                          print("Current position ${currentPosition.latitude}, ${currentPosition.longitude}");
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
