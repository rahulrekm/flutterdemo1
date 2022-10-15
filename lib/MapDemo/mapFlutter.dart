import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PopupController _popupController = PopupController();
  MapController _mapController = MapController();
  double _zoom = 7;
  List<LatLng> _latLngList = [
    LatLng(9.965, 76.302),
    LatLng(9.972, 76.452),
  ];
  List<Marker> _markers = [];

  @override
  void initState() {
    _markers = _latLngList
        .map((point) => Marker(
      point: point,
      width: 60,
      height: 60,
      builder: (context) => Icon(
        Icons.pin_drop,
        size: 60,
        color: Colors.blueAccent,
      ),
    ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Flutter Map'),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          // swPanBoundary: LatLng(13, 77.5),
          // nePanBoundary: LatLng(13.07001, 77.58),
          center: _latLngList[0],
          bounds: LatLngBounds.fromPoints(_latLngList),
          zoom: _zoom,
          plugins: [
            MarkerClusterPlugin(),
          ],
        // onTap: (_) => _popupController.hideAllPopups(),
        ),
        layers: [
          TileLayerOptions(
            minZoom: 2,
            maxZoom: 18,
            backgroundColor: Colors.black,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 190,
            disableClusteringAtZoom: 16,
            size: Size(50, 50),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: _markers,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
                popupSnap: PopupSnap.mapTop,
                popupController: _popupController,
                popupBuilder: (_, marker) => Container(
                  color: Colors.amberAccent,
                  child: Text('Popup'),
                )),
            builder: (context, markers) {
              return Container(
                alignment: Alignment.center,
                decoration:
                BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                child: Text('${markers.length}'),
              );
            },
          ),
        ],
      ),
    );
  }
}